Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1A47CEEEC02
	for <linux-i3c@archiver.kernel.org>; Tue, 17 Sep 2024 14:43:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Message-ID:MIME-Version:References:
	In-Reply-To:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=YVn1MlbRG2k2+1bXpt063dcHtWJeoieG4UB1XMeNV2M=; b=xhyCBtJEKEBGjC
	BRaeVSj9cgg8I0/eJ/eHlseY1Uanox4J4HIPogF8tjG+eJ36pGNVJwigT7asMo6OJBW3MfgxPvdnk
	aUbBu4ADgnzBv4WkDtTVSnzhVW7EXbju6AUBsx1W8a9ZErUnHF8lfp8LZk+QfMOwRXoq0hAY0EfSR
	G/fj+fjSh6AI/gprR3P4ft+tzZH4bSyOIJv6EAD01SANxWwTRC/Nl+kpBkiaFa3XVLnsoBnA2/F2/
	apxsuMunzjEfVQWAuQn/PssZNV9saTD3FW08lAUK5W6o6CcAFAkwsXQCzoMw4XHgfATFFDMb7+WrX
	imAua90rqqe+E+mteCwA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1sqZQc-00000006KlN-3LXO;
	Tue, 17 Sep 2024 14:43:42 +0000
Received: from smtpbgeu1.qq.com ([52.59.177.22])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1son48-0000000DllJ-0FE7
	for linux-i3c@lists.infradead.org;
	Thu, 12 Sep 2024 16:53:13 +0000
X-QQ-mid: bizesmtp79t1726159961toq43fll
X-QQ-Originating-IP: rL1x0Rat/nncHimj4lJmjDQwPeyyf/2EuepTUgnHA+A=
Received: from m16.mail.163.com ( [117.135.210.3])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Fri, 13 Sep 2024 00:52:39 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 15712298379917099184
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=Date:From:Subject:Content-Type:MIME-Version:
	Message-ID; bh=zt3evTV/LPdQes2sdSNIks22MRrncz8ZWesD68rrhhY=; b=L
	LtTqI8j/zR0OcpLhW29Zs+uu/Nu0Ry6EzCpwbomwobGez4v7r1iK3GAo8f5fW2G5
	alvrT+yhvVRuxOvmoagIh2KirOlqUPj08sYE7sh2zEvL7ese7JUgL0Ub0ZQvwVZ/
	XgcNYV3rBsoABO5ZnqBe6KWeFAc9ud+MnZ3AB05PJM=
Received: from kxwang23$m.fudan.edu.cn ( [104.238.222.239] ) by
 ajax-webmail-wmsvr-40-136 (Coremail) ; Fri, 13 Sep 2024 00:52:05 +0800
 (CST)
X-Originating-IP: [104.238.222.239]
Date: Fri, 13 Sep 2024 00:52:05 +0800 (CST)
From: "Kaixin Wang" <kxwang23@m.fudan.edu.cn>
To: "Frank Li" <Frank.li@nxp.com>
Cc: miquel.raynal@bootlin.com, 21210240012@m.fudan.edu.cn, 
	21302010073@m.fudan.edu.cn, conor.culhane@silvaco.com, 
	alexandre.belloni@bootlin.com, linux-i3c@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] i3c: master: svc: Fix use after free vulnerability in
 svc_i3c_master Driver Due to Race Condition
X-Priority: 3
X-Mailer: Coremail Webmail Server Version XT5.0.14 build 20240801(9da12a7b)
 Copyright (c) 2002-2024 www.mailtech.cn 163com
In-Reply-To: <ZuG2SbsHEU5BU9mX@lizhi-Precision-Tower-5810>
References: <20240911150135.839946-1-kxwang23@m.fudan.edu.cn>
 <ZuG2SbsHEU5BU9mX@lizhi-Precision-Tower-5810>
X-NTES-SC: AL_Qu2ZBP2etkEp4yKfbOkXn0kbjug3WcW0u/0k3oJUNps0sSbJxCIce1FGAHTrzv+TMyOvnjaRQClvyeFHTa9cY5gFCYNNOhAGDD6ta/FAxMmY
MIME-Version: 1.0
Message-ID: <DEA8C409E7FC03F8+419f2dd.c282.191e726302a.Coremail.kxwang23@m.fudan.edu.cn>
X-Coremail-Locale: zh_CN
X-CM-TRANSID: _____wDnr5c1HONmiJAFAA--.2351W
X-CM-SenderInfo: zprtkiiuqyikitw6il2tof0z/1tbiwh5Y2GWXw6aYUAAIsL
X-Coremail-Antispam: 1U5529EdanIXcx71UUUUU7vcSsGvfC2KfnxnUU==
X-QQ-SENDSIZE: 520
Feedback-ID: bizesmtp:m.fudan.edu.cn:qybglogicsvrsz:qybglogicsvrsz4a-0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240912_095308_579802_3F5A0137 
X-CRM114-Status: GOOD (  13.81  )
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

CgrlnKggMjAyNC0wOS0xMSAyMzoyNDo1N++8jCJGcmFuayBMaSIgPEZyYW5rLmxpQG54cC5jb20+
IOWGmemBk++8mgo+T24gV2VkLCBTZXAgMTEsIDIwMjQgYXQgMTE6MDE6MzVQTSArMDgwMCwgS2Fp
eGluIFdhbmcgd3JvdGU6Cj4+IEluIHRoZSBzdmNfaTNjX21hc3Rlcl9wcm9iZSBmdW5jdGlvbiwg
Jm1hc3Rlci0+aGpfd29yayBpcyBib3VuZCB3aXRoCj4+IHN2Y19pM2NfbWFzdGVyX2hqX3dvcmss
ICZtYXN0ZXItPmliaV93b3JrIGlzIGJvdW5kIHdpdGgKPj4gc3ZjX2kzY19tYXN0ZXJfaWJpX3dv
cmsuIEFuZCBzdmNfaTNjX21hc3Rlcl9pYmlfd29yayDCoGNhbiBzdGFydCB0aGUKPj4gaGpfd29y
aywgc3ZjX2kzY19tYXN0ZXJfaXJxX2hhbmRsZXIgY2FuIHN0YXJ0IHRoZSBpYmlfd29yay4KPj4K
Pj4gSWYgd2UgcmVtb3ZlIHRoZSBtb2R1bGUgd2hpY2ggd2lsbCBjYWxsIHN2Y19pM2NfbWFzdGVy
X3JlbW92ZSB0bwo+PiBtYWtlIGNsZWFudXAsIGl0IHdpbGwgZnJlZSBtYXN0ZXItPmJhc2UgdGhy
b3VnaCBpM2NfbWFzdGVyX3VucmVnaXN0ZXIKPj4gd2hpbGUgdGhlIHdvcmsgbWVudGlvbmVkIGFi
b3ZlIHdpbGwgYmUgdXNlZC4gVGhlIHNlcXVlbmNlIG9mIG9wZXJhdGlvbnMKPj4gdGhhdCBtYXkg
bGVhZCB0byBhIFVBRiBidWcgaXMgYXMgZm9sbG93czoKPj4KPj4gQ1BVMCAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgQ1BVMQo+Pgo+PiAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICB8IHN2Y19pM2NfbWFzdGVyX2hqX3dvcmsKPj4gc3ZjX2kzY19tYXN0
ZXJfcmVtb3ZlICAgICAgICAgICAgICAgfAo+PiBpM2NfbWFzdGVyX3VucmVnaXN0ZXIoJm1hc3Rl
ci0+YmFzZSl8Cj4+IGRldmljZV91bnJlZ2lzdGVyKCZtYXN0ZXItPmRldikgICAgIHwKPj4gZGV2
aWNlX3JlbGVhc2UgICAgICAgICAgICAgICAgICAgICAgfAo+PiAvL2ZyZWUgbWFzdGVyLT5iYXNl
ICAgICAgICAgICAgICAgICB8Cj4+ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
IHwgaTNjX21hc3Rlcl9kb19kYWEoJm1hc3Rlci0+YmFzZSkKPj4gICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgfCAvL3VzZSBtYXN0ZXItPmJhc2UKPj4KPj4gRml4IGl0IGJ5IGVu
c3VyaW5nIHRoYXQgdGhlIHdvcmsgaXMgY2FuY2VsZWQgYmVmb3JlIHByb2NlZWRpbmcgd2l0aCB0
aGUKPj4gY2xlYW51cCBpbiBzdmNfaTNjX21hc3Rlcl9yZW1vdmUuCj4+Cj4+IFNpZ25lZC1vZmYt
Ynk6IEthaXhpbiBXYW5nIDxreHdhbmcyM0BtLmZ1ZGFuLmVkdS5jbj4KPj4gLS0tCj4KPlBsZWFz
ZSBhZGQgZml4ZXMgdGFnIGFuZCBjYyBzdGFibGUuCj4KPkZyYW5rCj4KCkkgd2lsbCBhZGQgdGhl
bSBpbiB0aGUgbmV4dCB2ZXJzaW9uIG9mIHRoZSBwYXRjaC4KCkJlc3QgcmVnYXJkcywKS2FpeGlu
IFdhbmcKCj4KPj4gIGRyaXZlcnMvaTNjL21hc3Rlci9zdmMtaTNjLW1hc3Rlci5jIHwgMSArCj4+
ICAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKykKPj4KPj4gZGlmZiAtLWdpdCBhL2RyaXZl
cnMvaTNjL21hc3Rlci9zdmMtaTNjLW1hc3Rlci5jIGIvZHJpdmVycy9pM2MvbWFzdGVyL3N2Yy1p
M2MtbWFzdGVyLmMKPj4gaW5kZXggMGE2OGZkMWI4MWQ0Li5lMDg0YmE2NDhiNGEgMTAwNjQ0Cj4+
IC0tLSBhL2RyaXZlcnMvaTNjL21hc3Rlci9zdmMtaTNjLW1hc3Rlci5jCj4+ICsrKyBiL2RyaXZl
cnMvaTNjL21hc3Rlci9zdmMtaTNjLW1hc3Rlci5jCj4+IEBAIC0xNzc1LDYgKzE3NzUsNyBAQCBz
dGF0aWMgdm9pZCBzdmNfaTNjX21hc3Rlcl9yZW1vdmUoc3RydWN0IHBsYXRmb3JtX2RldmljZSAq
cGRldikKPj4gIHsKPj4gIAlzdHJ1Y3Qgc3ZjX2kzY19tYXN0ZXIgKm1hc3RlciA9IHBsYXRmb3Jt
X2dldF9kcnZkYXRhKHBkZXYpOwo+Pgo+PiArCWNhbmNlbF93b3JrX3N5bmMoJm1hc3Rlci0+aGpf
d29yayk7Cj4+ICAJaTNjX21hc3Rlcl91bnJlZ2lzdGVyKCZtYXN0ZXItPmJhc2UpOwo+Pgo+PiAg
CXBtX3J1bnRpbWVfZG9udF91c2VfYXV0b3N1c3BlbmQoJnBkZXYtPmRldik7Cj4+IC0tCj4+IDIu
MjUuMQo+Pgo+Ci0tIApsaW51eC1pM2MgbWFpbGluZyBsaXN0CmxpbnV4LWkzY0BsaXN0cy5pbmZy
YWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGlu
dXgtaTNjCg==
