Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0AC98CDB465
	for <linux-i3c@archiver.kernel.org>; Thu, 19 Oct 2023 06:45:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=scPjobmMDNPrMw3GKVyoaMwTK3WBvAzQC749A+YmDQg=; b=4V+kc9tyGY/kDx
	zNpGVb9KNuC5CQpVu4zjz7drlfKUmE5wIootjosTIcD0MJ1/vk6WpD8/j+1ksaXOmFNU3j0ednWme
	PQSR10bkUNBkQWmYhK/3pDttZ85Lf9kEWkDIUibW7PH4r4pTsUMyTr7twJerwQAOV2E2ISr/UX8qd
	nLhnjk+ZcHcPhAJW3E6hFF3S9ug57g+EerXD+R954/Qa2tQT7yrFonuBuABGXBlBzGIxUNANEFoC0
	PeoTwvtwBmp7A3zvp1n56H9wzah+dIywVi1nBJ38BiqlWxGO9oE951c5bZSof2NGOpihCt0JufSAk
	01BfGea9W6/clIDTRfrQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qtMmH-00GWve-1M;
	Thu, 19 Oct 2023 06:45:05 +0000
Received: from relay3-d.mail.gandi.net ([217.70.183.195])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qtMmE-00GWuH-0Y
	for linux-i3c@lists.infradead.org;
	Thu, 19 Oct 2023 06:45:04 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id E773460002;
	Thu, 19 Oct 2023 06:44:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1697697896;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=pLQy0z/148h9q9gR223NPowUSBgZtPyoLjW6cE0Fr0Y=;
	b=TLR5LKqnonGG9PJg6HVhImuCH2K++DgskOtHCv4TbaN3CItv6sMPF0e/alCsWaLx3jcByI
	qxMt2YJ1AnBlx9lDO0CODPCUuL66R6JWVDJ8nE5k4fwwyBS9xoRTznJUbK2dLZzgay/GKu
	l+kDAr9nGIc3folCeeCe9LvsbYx7ipzkBSk+uUBc+VTLBbUdKQ5khH8G8wEmXp88jelgLm
	NL5JIshMWV8lfTfwcetsBo+IX5TSVNuLCuy6wGda0DY/68HAPtB5NcgSsV1zHiB2rfNCKs
	Dm6mtYnRgCUIdeXgww3X16kJ/AgQud0zBtpucRBt5ruck1UeTCHcmyGV/8somg==
Date: Thu, 19 Oct 2023 08:44:52 +0200
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Frank Li <Frank.Li@nxp.com>
Cc: alexandre.belloni@bootlin.com, conor.culhane@silvaco.com,
 imx@lists.linux.dev, joe@perches.com, linux-i3c@lists.infradead.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 Resent 6/6] i3c: master: svc: fix random hot join
 failure since timeout error
Message-ID: <20231019084452.11fd0645@xps-13>
In-Reply-To: <20231018155926.3305476-7-Frank.Li@nxp.com>
References: <20231018155926.3305476-1-Frank.Li@nxp.com>
	<20231018155926.3305476-7-Frank.Li@nxp.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: miquel.raynal@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231018_234502_541254_63F9FC59 
X-CRM114-Status: GOOD (  18.46  )
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

SGkgRnJhbmssCgpGcmFuay5MaUBueHAuY29tIHdyb3RlIG9uIFdlZCwgMTggT2N0IDIwMjMgMTE6
NTk6MjYgLTA0MDA6Cgo+IG1hc3RlciBzaWRlIHJlcG9ydDoKPiAgIHNpbHZhY28taTNjLW1hc3Rl
ciA0NDMzMDAwMC5pM2MtbWFzdGVyOiBFcnJvciBjb25kaXRpb246IE1TVEFUVVMgMHgwMjAwOTBj
NywgTUVSUldBUk4gMHgwMDEwMDAwMAo+IAo+IEJJVCAyMDogVElNRU9VVCBlcnJvcgo+ICAgVGhl
IG1vZHVsZSBoYXMgc3RhbGxlZCB0b28gbG9uZyBpbiBhIGZyYW1lLiBUaGlzIGhhcHBlbnMgd2hl
bjoKPiAgIC0gVGhlIFRYIEZJRk8gb3IgUlggRklGTyBpcyBub3QgaGFuZGxlZCBhbmQgdGhlIGJ1
cyBpcyBzdHVjayBpbiB0aGUKPiBtaWRkbGUgb2YgYSBtZXNzYWdlLAo+ICAgLSBObyBTVE9QIHdh
cyBpc3N1ZWQgYW5kIGJldHdlZW4gbWVzc2FnZXMsCj4gICAtIElCSSBtYW51YWwgaXMgdXNlZCBh
bmQgbm8gZGVjaXNpb24gd2FzIG1hZGUuCgpJIGFtIHN0aWxsIG5vdCBjb252aW5jZWQgdGhpcyBz
aG91bGQgYmUgaWdub3JlZCBpbiBhbGwgY2FzZXMuCgpDYXNlIDEgaXMgYSBwcm9ibGVtIGJlY2F1
c2UgdGhlIGhhcmR3YXJlIGZhaWxlZCBzb21laG93LgpDYXNlIDIgaXMgZmluZSBJIGd1ZXNzLgpD
YXNlIDMgaXMgbm90IHBvc3NpYmxlIGluIExpbnV4LCB0aGlzIHdpbGwgbm90IGJlIHN1cHBvcnRl
ZC4KCj4gICBUaGUgbWF4aW11bSBzdGFsbCBwZXJpb2QgaXMgMTAgS0h6IG9yIDEwMCDOvHMuCgpz
LzEwIEtIei8vCgo+IAo+IFRoaXMgaXMgYSBqdXN0IHdhcm5pbmcuIFN5c3RlbSBpcnEgdGhyZWFk
IHNjaGVkdWxlIGxhdGVuY3kgaXMgcG9zc2libGUKPiBiaWdnZXIgdGhhbiAxMDB1cy4gSnVzdCBv
bWl0IHRoaXMgd2FyaW5nLgoKVGhpcyBjYW4gYmUgY29uc2lkZXJlZCBhcyBiZWluZyBqdXN0IGEg
d2FybmluZyBhcyB0aGUgc3lzdGVtIElSUQpsYXRlbmN5IGNhbiBlYXNpbHkgYmUgZ3JlYXRlciB0
aGFuIDEwMHVzLgoKPiAKPiBGaXhlczogZGQzYzUyODQ2ZDU5ICgiaTNjOiBtYXN0ZXI6IHN2Yzog
QWRkIFNpbHZhY28gSTNDIG1hc3RlciBkcml2ZXIiKQo+IENjOiBzdGFibGVAdmdlci5rZXJuZWwu
b3JnCj4gU2lnbmVkLW9mZi1ieTogRnJhbmsgTGkgPEZyYW5rLkxpQG54cC5jb20+Cj4gLS0tCj4g
Cj4gTm90ZXM6Cj4gICAgIENoYW5nZSBmcm9tIHYxIHRvIHYyCj4gICAgIC1ub25lCj4gCj4gIGRy
aXZlcnMvaTNjL21hc3Rlci9zdmMtaTNjLW1hc3Rlci5jIHwgNiArKysrKysKPiAgMSBmaWxlIGNo
YW5nZWQsIDYgaW5zZXJ0aW9ucygrKQo+IAo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2kzYy9tYXN0
ZXIvc3ZjLWkzYy1tYXN0ZXIuYyBiL2RyaXZlcnMvaTNjL21hc3Rlci9zdmMtaTNjLW1hc3Rlci5j
Cj4gaW5kZXggMWE1N2ZkZWJhYTI2ZC4uZmVkYjMxZTAwNzZjNCAxMDA2NDQKPiAtLS0gYS9kcml2
ZXJzL2kzYy9tYXN0ZXIvc3ZjLWkzYy1tYXN0ZXIuYwo+ICsrKyBiL2RyaXZlcnMvaTNjL21hc3Rl
ci9zdmMtaTNjLW1hc3Rlci5jCj4gQEAgLTkzLDYgKzkzLDcgQEAKPiAgI2RlZmluZSBTVkNfSTND
X01JTlRNQVNLRUQgICAweDA5OAo+ICAjZGVmaW5lIFNWQ19JM0NfTUVSUldBUk4gICAgIDB4MDlD
Cj4gICNkZWZpbmUgICBTVkNfSTNDX01FUlJXQVJOX05BQ0sgQklUKDIpCj4gKyNkZWZpbmUgICBT
VkNfSTNDX01FUlJXQVJOX1RJTUVPVVQgQklUKDIwKQo+ICAjZGVmaW5lIFNWQ19JM0NfTURNQUNU
UkwgICAgIDB4MEEwCj4gICNkZWZpbmUgU1ZDX0kzQ19NREFUQUNUUkwgICAgMHgwQUMKPiAgI2Rl
ZmluZSAgIFNWQ19JM0NfTURBVEFDVFJMX0ZMVVNIVEIgQklUKDApCj4gQEAgLTIyNiw2ICsyMjcs
MTEgQEAgc3RhdGljIGJvb2wgc3ZjX2kzY19tYXN0ZXJfZXJyb3Ioc3RydWN0IHN2Y19pM2NfbWFz
dGVyICptYXN0ZXIpCj4gIAlpZiAoU1ZDX0kzQ19NU1RBVFVTX0VSUldBUk4obXN0YXR1cykpIHsK
PiAgCQltZXJyd2FybiA9IHJlYWRsKG1hc3Rlci0+cmVncyArIFNWQ19JM0NfTUVSUldBUk4pOwo+
ICAJCXdyaXRlbChtZXJyd2FybiwgbWFzdGVyLT5yZWdzICsgU1ZDX0kzQ19NRVJSV0FSTik7Cj4g
Kwo+ICsJCS8qIGlnbm9yZSB0aW1lb3V0IGVycm9yICovCj4gKwkJaWYgKG1lcnJ3YXJuICYgU1ZD
X0kzQ19NRVJSV0FSTl9USU1FT1VUKQo+ICsJCQlyZXR1cm4gZmFsc2U7Cj4gKwo+ICAJCWRldl9l
cnIobWFzdGVyLT5kZXYsCj4gIAkJCSJFcnJvciBjb25kaXRpb246IE1TVEFUVVMgMHglMDh4LCBN
RVJSV0FSTiAweCUwOHhcbiIsCj4gIAkJCW1zdGF0dXMsIG1lcnJ3YXJuKTsKCgpUaGFua3MsCk1p
cXXDqGwKCi0tIApsaW51eC1pM2MgbWFpbGluZyBsaXN0CmxpbnV4LWkzY0BsaXN0cy5pbmZyYWRl
YWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgt
aTNjCg==
