Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 94AB5FC618C
	for <linux-i3c@archiver.kernel.org>; Tue, 17 Sep 2024 14:43:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Message-ID:MIME-Version:References:
	In-Reply-To:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=AMEkdbckJnunRiPunebV9FBztLy5P7FXuqyWw1OLJ44=; b=pgWm6OyxSLDnuG
	LOn9wfXzL6Svtm7aPjl7gWf3KpOAHhMQ34fcOrx+knr0+mH5Zm1mOFd2/VFb4id/wBD9hP5lR1GMO
	iM7ge58arOicc6v/krlsF0PUpcT5kw0eC8sh0MCkG9FH/egCitE+MDbjWIAiSEg9DuA8+kKIlDlum
	JSNK+kOtyvaGMHGYqc+5WLNS5OaRYLlKvNcl1DlgCM/tqZiQVsSZEFwlBSgeNcNja64hqQkjrwGyB
	ZGz8Mht2J/gZpBDoBg0MOkvySjSc2TOqcE9/FUC7jGfk1mfz+eDyb9JviT7B5TGN4LTS4qnVHzjIN
	NqoNZPItn8hFnYh3oCRQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1sqZQd-00000006KlX-16IR;
	Tue, 17 Sep 2024 14:43:43 +0000
Received: from smtpbgsg2.qq.com ([54.254.200.128])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1son6a-0000000Dm4R-1SuP
	for linux-i3c@lists.infradead.org;
	Thu, 12 Sep 2024 16:55:41 +0000
X-QQ-mid: bizesmtpsz5t1726160119t7d8kh6
X-QQ-Originating-IP: Zx7oaLjVt1vFN6j3A7H9ICZ/KuQQ0JHOm7wpnlbAoUA=
Received: from m16.mail.163.com ( [117.135.210.5])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Fri, 13 Sep 2024 00:55:17 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 16381243121260492792
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=Date:From:Subject:Content-Type:MIME-Version:
	Message-ID; bh=H/YC5ZRJVMFIwIEo1fHTYKgGKi1Vxrzsf5zIKLg/VCg=; b=I
	ai0yfONFjkRdTmt3gRnQgp0Lq3WeP/sjKenDPywK4HNzy3eMECAZH4ELOfpR0U0n
	0ukxgfL63ZvkGRxTp5VBXDLp9HoCQ5UwyANYi0snTyviMzDVQEDjkb8BaoimDNnh
	LBWYgGrU4XwKRqbSSfxIZKxbBQHgyrdWbh5nTOBIC4=
Received: from kxwang23$m.fudan.edu.cn ( [104.238.222.239] ) by
 ajax-webmail-wmsvr-40-136 (Coremail) ; Fri, 13 Sep 2024 00:54:39 +0800
 (CST)
X-Originating-IP: [104.238.222.239]
Date: Fri, 13 Sep 2024 00:54:39 +0800 (CST)
From: "Kaixin Wang" <kxwang23@m.fudan.edu.cn>
To: "Miquel Raynal" <miquel.raynal@bootlin.com>
Cc: "Frank Li" <Frank.li@nxp.com>, 21210240012@m.fudan.edu.cn, 
	21302010073@m.fudan.edu.cn, conor.culhane@silvaco.com, 
	alexandre.belloni@bootlin.com, linux-i3c@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] i3c: master: svc: Fix use after free vulnerability in
 svc_i3c_master Driver Due to Race Condition
X-Priority: 3
X-Mailer: Coremail Webmail Server Version XT5.0.14 build 20240801(9da12a7b)
 Copyright (c) 2002-2024 www.mailtech.cn 163com
In-Reply-To: <20240912085709.6ec0a289@xps-13>
References: <20240911150135.839946-1-kxwang23@m.fudan.edu.cn>
 <ZuG2SbsHEU5BU9mX@lizhi-Precision-Tower-5810>
 <20240912085709.6ec0a289@xps-13>
X-NTES-SC: AL_Qu2ZBP2dv0gs7ySeZOkXn0kbjug3WcW0u/0k3oJUNps0sSbJxCIce1FGAHTrzv+TMyOvnjaRQClvyeFHTa9cY5gZc/65IYnnfpHCxo0OHY+7
MIME-Version: 1.0
Message-ID: <C05F548F941D5F36+47d9e505.c28c.191e7288a6e.Coremail.kxwang23@m.fudan.edu.cn>
X-Coremail-Locale: zh_CN
X-CM-TRANSID: _____wD3H_vPHONmxpAFAA--.2860W
X-CM-SenderInfo: zprtkiiuqyikitw6il2tof0z/1tbiwh5Y2GWXw6aYUAAJsK
X-Coremail-Antispam: 1U5529EdanIXcx71UUUUU7vcSsGvfC2KfnxnUU==
X-QQ-SENDSIZE: 520
Feedback-ID: bizesmtpsz:m.fudan.edu.cn:qybglogicsvrsz:qybglogicsvrsz4a-0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240912_095540_747723_3EC94C6E 
X-CRM114-Status: GOOD (  14.75  )
X-Mailman-Approved-At: Tue, 17 Sep 2024 07:43:41 -0700
X-BeenThere: linux-i3c@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-i3c.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-i3c>,
 <mailto:linux-i3c-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-i3c/>
List-Post: <mailto:linux-i3c@lists.infradead.org>
List-Help: <mailto:linux-i3c-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-i3c>,
 <mailto:linux-i3c-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-i3c" <linux-i3c-bounces@lists.infradead.org>
Errors-To: linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org

CgrlnKggMjAyNC0wOS0xMiAxNDo1NzowOe+8jCJNaXF1ZWwgUmF5bmFsIiA8bWlxdWVsLnJheW5h
bEBib290bGluLmNvbT4g5YaZ6YGT77yaCj5IaSwKPgo+RnJhbmsubGlAbnhwLmNvbSB3cm90ZSBv
biBXZWQsIDExIFNlcCAyMDI0IDExOjI0OjU3IC0wNDAwOgo+Cj4+IE9uIFdlZCwgU2VwIDExLCAy
MDI0IGF0IDExOjAxOjM1UE0gKzA4MDAsIEthaXhpbiBXYW5nIHdyb3RlOgo+PiA+IEluIHRoZSBz
dmNfaTNjX21hc3Rlcl9wcm9iZSBmdW5jdGlvbiwgJm1hc3Rlci0+aGpfd29yayBpcyBib3VuZCB3
aXRoCj4+ID4gc3ZjX2kzY19tYXN0ZXJfaGpfd29yaywgJm1hc3Rlci0+aWJpX3dvcmsgaXMgYm91
bmQgd2l0aAo+PiA+IHN2Y19pM2NfbWFzdGVyX2liaV93b3JrLiBBbmQgc3ZjX2kzY19tYXN0ZXJf
aWJpX3dvcmsgwqBjYW4gc3RhcnQgdGhlCj4+ID4gaGpfd29yaywgc3ZjX2kzY19tYXN0ZXJfaXJx
X2hhbmRsZXIgY2FuIHN0YXJ0IHRoZSBpYmlfd29yay4KPj4gPgo+PiA+IElmIHdlIHJlbW92ZSB0
aGUgbW9kdWxlIHdoaWNoIHdpbGwgY2FsbCBzdmNfaTNjX21hc3Rlcl9yZW1vdmUgdG8KPj4gPiBt
YWtlIGNsZWFudXAsIGl0IHdpbGwgZnJlZSBtYXN0ZXItPmJhc2UgdGhyb3VnaCBpM2NfbWFzdGVy
X3VucmVnaXN0ZXIKPj4gPiB3aGlsZSB0aGUgd29yayBtZW50aW9uZWQgYWJvdmUgd2lsbCBiZSB1
c2VkLiBUaGUgc2VxdWVuY2Ugb2Ygb3BlcmF0aW9ucwo+PiA+IHRoYXQgbWF5IGxlYWQgdG8gYSBV
QUYgYnVnIGlzIGFzIGZvbGxvd3M6Cj4+ID4KPj4gPiBDUFUwICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICBDUFUxCj4+ID4KPj4gPiAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICB8IHN2Y19pM2NfbWFzdGVyX2hqX3dvcmsKPj4gPiBzdmNfaTNjX21hc3Rl
cl9yZW1vdmUgICAgICAgICAgICAgICB8Cj4+ID4gaTNjX21hc3Rlcl91bnJlZ2lzdGVyKCZtYXN0
ZXItPmJhc2UpfAo+PiA+IGRldmljZV91bnJlZ2lzdGVyKCZtYXN0ZXItPmRldikgICAgIHwKPj4g
PiBkZXZpY2VfcmVsZWFzZSAgICAgICAgICAgICAgICAgICAgICB8Cj4+ID4gLy9mcmVlIG1hc3Rl
ci0+YmFzZSAgICAgICAgICAgICAgICAgfAo+PiA+ICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgIHwgaTNjX21hc3Rlcl9kb19kYWEoJm1hc3Rlci0+YmFzZSkKPj4gPiAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICB8IC8vdXNlIG1hc3Rlci0+YmFzZQo+PiA+Cj4+
ID4gRml4IGl0IGJ5IGVuc3VyaW5nIHRoYXQgdGhlIHdvcmsgaXMgY2FuY2VsZWQgYmVmb3JlIHBy
b2NlZWRpbmcgd2l0aCB0aGUKPj4gPiBjbGVhbnVwIGluIHN2Y19pM2NfbWFzdGVyX3JlbW92ZS4K
Pj4gPgo+PiA+IFNpZ25lZC1vZmYtYnk6IEthaXhpbiBXYW5nIDxreHdhbmcyM0BtLmZ1ZGFuLmVk
dS5jbj4KPj4gPiAtLS0gIAo+PiAKPj4gUGxlYXNlIGFkZCBmaXhlcyB0YWcgYW5kIGNjIHN0YWJs
ZS4KPgo+WWVzIGluZGVlZC4gT3RoZXJ3aXNlIGxvb2tzIGdvb2QgdG8gbWUgb25jZSB0aGlzIGZp
eGVkLgo+Cj5SZXZpZXdlZC1ieTogTWlxdWVsIFJheW5hbCA8bWlxdWVsLnJheW5hbEBib290bGlu
LmNvbT4KPgo+VGhhbmtzLAo+TWlxdcOobAo+CgpUaGFua3MgZm9yIHRoZSByZXZpZXchCgpCZXN0
IHJlZ2FyZHMsCkthaXhpbiBXYW5nCi0tIApsaW51eC1pM2MgbWFpbGluZyBsaXN0CmxpbnV4LWkz
Y0BsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4v
bGlzdGluZm8vbGludXgtaTNjCg==
