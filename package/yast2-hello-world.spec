#
# spec file for package yast2-hello-world
#
# Copyright (c) 2020 SUSE LINUX GmbH, Nuernberg, Germany.
#
# All modifications and additions to the file contributed by third parties
# remain the property of their copyright owners, unless otherwise agreed
# upon. The license for this file, and modifications and additions to the
# file, is the same license as for the pristine package itself (unless the
# license for the pristine package is not an Open Source License, in which
# case the license is the MIT License). An "Open Source License" is a
# license that conforms to the Open Source Definition (Version 1.9)
# published by the Open Source Initiative.

# Please submit bugfixes or comments via http://bugs.opensuse.org/
#


Name:           yast2-hello-world
Version:        0.0.0
Release:        0
Summary:        Simple YaST Hello World module to create minimum structure and a working module.
License:        GPL-2.0-only
Group:          System/YaST 
Url:            https://github.com/dwbenjamin/yast-hello-world

Source:         %{name}-%{version}.tar.bz2
BuildRequires:  yast2 >= 3.1.176
BuildRequires:  yast2-ruby-bindings >= 1.0.0
BuildRequires:  rubygem(%rb_default_ruby_abi:rspec)
BuildRequires:  rubygem(%rb_default_ruby_abi:yast-rake)

Requires:       yast2 >= 3.1.176
Requires:       yast2-core >= 2.18.7
Requires:       yast2-ruby-bindings >= 1.0.0

BuildRoot:      %{_tmppath}/%{name}-%{version}-build

%description
This package is an example of a YaST module.

%prep
%setup -q

%check
%yast_check

%build

%install
%yast_install
%yast_metainfo

%post

%postun

%files
%defattr(-,root,root)
%doc CONTRIBUTING.md README.md SECURITY.md
%license COPYING
%{yast_desktopdir}
%{yast_metainfodir}
%{yast_moduledir}
%{yast_clientdir}
%{yast_ybindir}
%{yast_scrconfdir}
%{yast_fillupdir}
%{yast_schemadir}
%{yast_libdir}
%{yast_icondir}
%doc %{yast_docdir}

%changelog

