Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8A811C624D4
	for <linux-i3c@archiver.kernel.org>; Thu,  3 Sep 2026 06:34:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:
	References:In-Reply-To:Cc:To:Subject:From:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=2nsBYQbvQgpygGizzM4DFVmqagsq3cweiQjJcJ6KRH8=; b=VPw+zerCXDf+mr
	doN7Mkf0DFR5qwdDsBe9AlrLIFqktkP4l2NW6Xaj3EvFEgtvmrLg4Sg3mAFO1L9ozntb+p0ZBpdFB
	JS0aayx2FA/iZQpGYtQ7bqi3zyofGKpuYYHKHnupf217uXfxaVB976cCB3/nE7t9u8FZynFjiDH5z
	kP/ExoTstUDXk9PvhlpXFFbgtgZmL/XiLH7/kWfk7CnYzhHUPbrYtWACX6PvCg63j7WsfkcUQWsj7
	1IQvKJU0xRMjptBGSpGWCTbpNfJNfvJ6I/J9biEwMGmoJqT8vFfyLL42m67+hyIXvQ91I27u9+dJL
	wLZrF32b0uKaobVKoYrQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x211n-0000000GUsX-13MM;
	Thu, 03 Sep 2026 06:34:27 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x211l-0000000GUsP-35js
	for linux-i3c@lists.infradead.org;
	Thu, 03 Sep 2026 06:34:25 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 3115B60233;
	Thu,  3 Sep 2026 06:34:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 75BFA1F000E9;
	Thu,  3 Sep 2026 06:34:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788417264;
	bh=KCcsyr09v6sKfqrUb8h2WOcFODSh7wHf/CiWArGzID0=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=gIQa0gfW8L/dweULdsFNeIM2n7n1P/E7SNuGqBZpPzbI9ra4FVwBdjtpfVcsLnmyE
	 3YZqo2arbJnZdcIBwtlxaGnvPxjTLVVUQuRErkRya+w81tJNFdtQH0Frsl9R8VwqxN
	 z6OZaAt3SgwAZ8T/WhjEQhYxbL4d54d3w4cMqldBmjyxeOIUrIh7jmn1KbYiiOnNqm
	 qZtyEefSelM/QLx6YA0uFr5qxQLOjUacQn3X7XjgpXa2oa1VN/ZHSC+nJrRas6Tm0m
	 ZNfagVLIr3AM4RUcuKVbPdz9mSTtepYODR0bxh90y3wzQJBWBCTNfXzNQCuMlqY52E
	 gjS3dAYkP24Sw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v18 1/8] i3c: master: Add APIs for I3C hub support
To: "Lakshay Piplani" <lakshay.piplani@nxp.com>
Cc: linux-i3c@lists.infradead.org, robh@kernel.org, Frank.Li@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org, "Alexandre
 Belloni" <alexandre.belloni@bootlin.com>
In-Reply-To: <20260903062108.2712296-2-lakshay.piplani@nxp.com>
References: <20260903062108.2712296-1-lakshay.piplani@nxp.com>
 <20260903062108.2712296-2-lakshay.piplani@nxp.com>
Date: Thu, 03 Sep 2026 06:34:23 +0000
Message-Id: <20260903063424.75BFA1F000E9@smtp.kernel.org>
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
Reply-To: sashiko-reviews@lists.linux.dev
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-i3c" <linux-i3c-bounces@lists.infradead.org>
Errors-To: linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org

VGhhbmsgeW91IGZvciB5b3VyIGNvbnRyaWJ1dGlvbiEgU2FzaGlrbyBBSSByZXZpZXcgZm91bmQg
MSBwb3RlbnRpYWwgaXNzdWUocykgdG8gY29uc2lkZXI6CgpQcmUtZXhpc3RpbmcgaXNzdWVzOgot
IFtIaWdoXSBJZ25vcmVkIHJldHVybiB2YWx1ZSBvZiBpM2NfbWFzdGVyX3JlYXR0YWNoX2kzY19k
ZXZfbG9ja2VkIGxlYWRzIHRvIGR5bmFtaWMgYWRkcmVzcyBjb2xsaXNpb24uCi0tCgpjb21taXQg
ZDU3OTYwOTM4OGNlMmUxYjIxMjdlNTgzMGIyNWQzOTIyOWJmMTY2NApBdXRob3I6IEFtYW4gS3Vt
YXIgUGFuZGV5IDxhbWFuLmt1bWFycGFuZGV5QG54cC5jb20+CgppM2M6IG1hc3RlcjogQWRkIEFQ
SXMgZm9yIEkzQyBodWIgc3VwcG9ydAoKVGhpcyBjb21taXQgYWRkcyBDQ0MgaGVscGVycywgYWRk
cmVzcyBzbG90IGhlbHBlcnMsIGFuZCBsb2NraW5nIGZ1bmN0aW9ucwp0byBwcmVwYXJlIGZvciBJ
M0MgaHViIHN1cHBvcnQuIEl0IGFsc28gZW5hYmxlcyByZWdpc3RlcmluZyB2aXJ0dWFsIG1hc3Rl
cnMKd2l0aCBhbiBleHBsaWNpdCBmaXJtd2FyZSBub2RlLgoKPiBkaWZmIC0tZ2l0IGEvZHJpdmVy
cy9pM2MvbWFzdGVyLmMgYi9kcml2ZXJzL2kzYy9tYXN0ZXIuYwo+IGluZGV4IGFmY2Q3YTIxYTNl
NjYuLjllYTQ3MjY0OTVmZjYgMTAwNjQ0Cj4gLS0tIGEvZHJpdmVycy9pM2MvbWFzdGVyLmMKPiAr
KysgYi9kcml2ZXJzL2kzYy9tYXN0ZXIuYwoKWyAuLi4gXQoKPiBAQCAtNDIyLDExICs0MzQsMTgg
QEAgc3RhdGljIHZvaWQgaTNjX2J1c19zZXRfYWRkcl9zbG90X3N0YXR1c19tYXNrKHN0cnVjdCBp
M2NfYnVzICpidXMsIHUxNiBhZGRyLAo+ICAJKnB0ciB8PSAoKHVuc2lnbmVkIGxvbmcpc3RhdHVz
ICYgbWFzaykgPDwgKGJpdHBvcyAlIEJJVFNfUEVSX0xPTkcpOwo+ICB9Cj4gIAo+IC1zdGF0aWMg
dm9pZCBpM2NfYnVzX3NldF9hZGRyX3Nsb3Rfc3RhdHVzKHN0cnVjdCBpM2NfYnVzICpidXMsIHUx
NiBhZGRyLAo+IC0JCQkJCSBlbnVtIGkzY19hZGRyX3Nsb3Rfc3RhdHVzIHN0YXR1cykKPiArLyoq
Cj4gKyAqIGkzY19idXNfc2V0X2FkZHJfc2xvdF9zdGF0dXMoKSAtIFNldCBJM0MgYnVzIGFkZHJl
c3Mgc2xvdCBzdGF0dXMKPiArICogQGJ1czogSTNDIGJ1cy4KPiArICogQGFkZHI6IEkzQyBhZGRy
ZXNzIHRvIHVwZGF0ZS4KPiArICogQHN0YXR1czogQWRkcmVzcyBzbG90IHN0YXR1cyB0byBzZXQu
Cj4gKyAqLwo+ICt2b2lkIGkzY19idXNfc2V0X2FkZHJfc2xvdF9zdGF0dXMoc3RydWN0IGkzY19i
dXMgKmJ1cywgdTE2IGFkZHIsCj4gKwkJCQkgIGVudW0gaTNjX2FkZHJfc2xvdF9zdGF0dXMgc3Rh
dHVzKQo+ICB7Cj4gIAlpM2NfYnVzX3NldF9hZGRyX3Nsb3Rfc3RhdHVzX21hc2soYnVzLCBhZGRy
LCBzdGF0dXMsIEkzQ19BRERSX1NMT1RfU1RBVFVTX01BU0spOwo+ICB9Cj4gK0VYUE9SVF9TWU1C
T0xfR1BMKGkzY19idXNfc2V0X2FkZHJfc2xvdF9zdGF0dXMpOwoKW1NldmVyaXR5OiBIaWdoXQpU
aGlzIGlzIGEgcHJlLWV4aXN0aW5nIGlzc3VlLCBidXQgd2hpbGUgcmV2aWV3aW5nIHRoaXMgcGF0
Y2ggYW5kIGhvdyBhZGRyZXNzCnNsb3RzIGFyZSBtYW5hZ2VkLCBJIG5vdGljZWQgYSBsb2dpYyBm
bGF3IGluIF9faTNjX21hc3Rlcl9hZGRfaTNjX2Rldl9sb2NrZWQoKSAKdGhhdCBjb3VsZCBsZWFk
IHRvIGR5bmFtaWMgYWRkcmVzcyBjb2xsaXNpb25zLgoKSWYgYSBkZXZpY2UgaXMgZXhwZWN0ZWQg
dG8gaGF2ZSBhIHNwZWNpZmljIGR5bmFtaWMgYWRkcmVzcywgaXQgYXR0ZW1wdHMgdG8KYXBwbHkg
aXQ6CgoJaWYgKCFyZXQpIHsKCQlvbGRfZHluX2FkZHIgPSBuZXdkZXYtPmluZm8uZHluX2FkZHI7
CgkJbmV3ZGV2LT5pbmZvLmR5bl9hZGRyID0gZXhwZWN0ZWRfZHluX2FkZHI7CgkJaTNjX21hc3Rl
cl9yZWF0dGFjaF9pM2NfZGV2X2xvY2tlZChuZXdkZXYsIG9sZF9keW5fYWRkcik7Cgl9IGVsc2Ug
ewoJCWRldl9lcnIoJm1hc3Rlci0+ZGV2LAoJCQkiRmFpbGVkIHRvIGFzc2lnbiByZXNlcnZlZC9v
bGQgYWRkcmVzcyB0byBkZXZpY2UuLi4iKTsKClRoZSByZXR1cm4gdmFsdWUgb2YgaTNjX21hc3Rl
cl9yZWF0dGFjaF9pM2NfZGV2X2xvY2tlZCgpIGlzIGRpc2NhcmRlZCBoZXJlLiAKSWYgcmVhdHRh
Y2htZW50IGZhaWxzLCB0aGF0IGZ1bmN0aW9uIGNsZWFucyB1cCBieSByZWxlYXNpbmcgdGhlIGFk
ZHJlc3NlczoKCglpZiAobWFzdGVyLT5vcHMtPnJlYXR0YWNoX2kzY19kZXYpIHsKCQlyZXQgPSBt
YXN0ZXItPm9wcy0+cmVhdHRhY2hfaTNjX2RldihkZXYsIG9sZF9keW5fYWRkcik7CgkJaWYgKHJl
dCkgewoJCQlpM2NfbWFzdGVyX3B1dF9pM2NfYWRkcnMoZGV2KTsKCQkJcmV0dXJuIHJldDsKCQl9
Cgl9CgpUaGlzIG1lYW5zIHRoZSBhZGRyZXNzIGlzIG1hcmtlZCBhcyBJM0NfQUREUl9TTE9UX0ZS
RUUgaW4gdGhlIGJ1cyBhZGRyc2xvdHMuIApIb3dldmVyLCBiZWNhdXNlIHRoZSBmYWlsdXJlIGlz
IGlnbm9yZWQgaW4gX19pM2NfbWFzdGVyX2FkZF9pM2NfZGV2X2xvY2tlZCgpLAp0aGUgZGV2aWNl
IHJlbWFpbnMgYWN0aXZlIGluIHRoZSBidXMgbGlzdC4gQSBzdWJzZXF1ZW50bHkgYWRkZWQgZGV2
aWNlIAooZS5nLiwgdmlhIGhvdC1qb2luKSBjb3VsZCB0aGVuIGJlIGFzc2lnbmVkIHRoaXMgZXhh
Y3Qgc2FtZSBhZGRyZXNzLCBjYXVzaW5nIAphbiBlbGVjdHJpY2FsIGNvbGxpc2lvbiBvbiB0aGUg
YnVzLgoKU2hvdWxkIHdlIGJlIGNoZWNraW5nIHRoZSByZXR1cm4gdmFsdWUgb2YgaTNjX21hc3Rl
cl9yZWF0dGFjaF9pM2NfZGV2X2xvY2tlZCgpCmFuZCBkZXRhY2hpbmcgdGhlIGRldmljZSBvciBy
ZXZlcnRpbmcgdGhlIGFkZHJlc3Mgc3RhdGUgaWYgaXQgZmFpbHM/CgotLSAKU2FzaGlrbyBBSSBy
ZXZpZXcgwrcgaHR0cHM6Ly9zYXNoaWtvLmRldi8jL3BhdGNoc2V0LzIwMjYwOTAzMDYyMTA4LjI3
MTIyOTYtMS1sYWtzaGF5LnBpcGxhbmlAbnhwLmNvbT9wYXJ0PTEKCi0tIApsaW51eC1pM2MgbWFp
bGluZyBsaXN0CmxpbnV4LWkzY0BsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZy
YWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtaTNjCg==
