Return-Path: <SRS0=sbX1=HS=lists.infradead.org=linux-i3c-bounces+linux-i3c=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_2 autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3EDDDC433DB
	for <linux-i3c@archiver.kernel.org>; Tue, 16 Feb 2021 15:21:12 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4933961606
	for <linux-i3c@archiver.kernel.org>; Tue, 16 Feb 2021 15:21:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 4933961606
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=2xTCAzmXQvCHd5XgDydXFsuJT56arFZklqhSiIs1D7Y=; b=FLZA6TtLStm+nb+hSu/sEqwCB
	5S3w2YaO31r/RXoT3wSfKaNdUOa4qY5/9Xr17lH1xiVmM4deedbuW1E9FBT280W8AN7NpSbPK47Km
	KhIJBrkx8QcuLJRM8KhiA1TJ+aXfVDnUOsGT1FekstR+F+QiDXTa14qjHOR74hx6fZmxxHNO+l7cK
	5EAU1ddQp0dGl4yUhtFPRpEOqky93174CMVT/iydmfoaHdhVB2kts+OZUXZUqGNWyiXa0ngSQP2HL
	RuUE/+ojXt81OCB+je7z5Y3BFUPAWrRFI1OLiSQ/dIKSdElBC29jiZelgRk72cgjO9oQo1cCZrRuW
	DPAoeIq5g==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1lC2A2-0005xs-8f; Tue, 16 Feb 2021 15:21:10 +0000
Received: from relay3-d.mail.gandi.net ([217.70.183.195])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1lC29z-0005wy-2f
 for linux-i3c@lists.infradead.org; Tue, 16 Feb 2021 15:21:08 +0000
X-Originating-IP: 86.210.203.113
Received: from xps13 (lfbn-tou-1-972-113.w86-210.abo.wanadoo.fr
 [86.210.203.113]) (Authenticated sender: miquel.raynal@bootlin.com)
 by relay3-d.mail.gandi.net (Postfix) with ESMTPSA id 6D8E160011;
 Tue, 16 Feb 2021 15:21:02 +0000 (UTC)
Date: Tue, 16 Feb 2021 16:21:01 +0100
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Dan Carpenter <dan.carpenter@oracle.com>
Subject: Re: [bug report] i3c: master: svc: Add Silvaco I3C master driver
Message-ID: <20210216162101.4bc23c46@xps13>
In-Reply-To: <YCJqmKHvBWFVIudi@mwanda>
References: <YCJqmKHvBWFVIudi@mwanda>
Organization: Bootlin
X-Mailer: Claws Mail 3.17.4 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210216_102107_248570_AFF6333A 
X-CRM114-Status: GOOD (  12.22  )
X-BeenThere: linux-i3c@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-i3c.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-i3c>,
 <mailto:linux-i3c-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-i3c/>
List-Post: <mailto:linux-i3c@lists.infradead.org>
List-Help: <mailto:linux-i3c-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-i3c>,
 <mailto:linux-i3c-request@lists.infradead.org?subject=subscribe>
Cc: linux-i3c@lists.infradead.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-i3c" <linux-i3c-bounces@lists.infradead.org>
Errors-To: linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org

SGkgRGFuLAoKVGhhbmtzIGZvciB0aGUgcmVwb3J0LgoKRGFuIENhcnBlbnRlciA8ZGFuLmNhcnBl
bnRlckBvcmFjbGUuY29tPiB3cm90ZSBvbiBUdWUsIDkgRmViIDIwMjEKMTM6NTc6MjggKzAzMDA6
Cgo+IEhlbGxvIE1pcXVlbCBSYXluYWwsCj4gCj4gVGhlIHBhdGNoIGRkM2M1Mjg0NmQ1OTogImkz
YzogbWFzdGVyOiBzdmM6IEFkZCBTaWx2YWNvIEkzQyBtYXN0ZXIKPiBkcml2ZXIiIGZyb20gSmFu
IDIxLCAyMDIxLCBsZWFkcyB0byB0aGUgZm9sbG93aW5nIHN0YXRpYyBjaGVja2VyCj4gd2Fybmlu
ZzoKPiAKPiAJZHJpdmVycy9pM2MvbWFzdGVyL3N2Yy1pM2MtbWFzdGVyLmM6Mzk0IHN2Y19pM2Nf
bWFzdGVyX2liaV93b3JrKCkKPiAJZXJyb3I6IHVuaW5pdGlhbGl6ZWQgc3ltYm9sICdkZXYnLgo+
IAo+IGRyaXZlcnMvaTNjL21hc3Rlci9zdmMtaTNjLW1hc3Rlci5jCj4gICAgMzY0ICAgICAgICAg
IHN0YXR1cyA9IHJlYWRsKG1hc3Rlci0+cmVncyArIFNWQ19JM0NfTVNUQVRVUyk7Cj4gICAgMzY1
ICAgICAgICAgIGliaXR5cGUgPSBTVkNfSTNDX01TVEFUVVNfSUJJVFlQRShzdGF0dXMpOwo+ICAg
IDM2NiAgICAgICAgICBpYmlhZGRyID0gU1ZDX0kzQ19NU1RBVFVTX0lCSUFERFIoc3RhdHVzKTsK
PiAgICAzNjcgIAo+ICAgIDM2OCAgICAgICAgICAvKiBIYW5kbGUgdGhlIGNyaXRpY2FsIHJlc3Bv
bnNlcyB0byBJQkkncyAqLwo+ICAgIDM2OSAgICAgICAgICBzd2l0Y2ggKGliaXR5cGUpIHsKPiAg
ICAzNzAgICAgICAgICAgY2FzZSBTVkNfSTNDX01TVEFUVVNfSUJJVFlQRV9JQkk6Cj4gICAgMzcx
ICAgICAgICAgICAgICAgICAgZGV2ID0gc3ZjX2kzY19tYXN0ZXJfZGV2X2Zyb21fYWRkcihtYXN0
ZXIsIGliaWFkZHIpOwo+ICAgIDM3MiAgICAgICAgICAgICAgICAgIGlmICghZGV2KQo+ICAgIDM3
MyAgICAgICAgICAgICAgICAgICAgICAgICAgc3ZjX2kzY19tYXN0ZXJfbmFja19pYmkobWFzdGVy
KTsKPiAgICAzNzQgICAgICAgICAgICAgICAgICBlbHNlCj4gICAgMzc1ICAgICAgICAgICAgICAg
ICAgICAgICAgICBzdmNfaTNjX21hc3Rlcl9oYW5kbGVfaWJpKG1hc3RlciwgZGV2KTsKPiAKPiAi
ZGV2IiBvbmx5IHZhbGlkIG9uIHRoaXMgcGF0aC4KPiAKPiAgICAzNzYgICAgICAgICAgICAgICAg
ICBicmVhazsKPiAgICAzNzcgICAgICAgICAgY2FzZSBTVkNfSTNDX01TVEFUVVNfSUJJVFlQRV9I
T1RfSk9JTjoKPiAgICAzNzggICAgICAgICAgICAgICAgICBzdmNfaTNjX21hc3Rlcl9hY2tfaWJp
KG1hc3RlciwgZmFsc2UpOwo+ICAgIDM3OSAgICAgICAgICAgICAgICAgIGJyZWFrOwo+ICAgIDM4
MCAgICAgICAgICBjYXNlIFNWQ19JM0NfTVNUQVRVU19JQklUWVBFX01BU1RFUl9SRVFVRVNUOgo+
ICAgIDM4MSAgICAgICAgICAgICAgICAgIHN2Y19pM2NfbWFzdGVyX25hY2tfaWJpKG1hc3Rlcik7
Cj4gICAgMzgyICAgICAgICAgICAgICAgICAgYnJlYWs7Cj4gICAgMzgzICAgICAgICAgIGRlZmF1
bHQ6Cj4gICAgMzg0ICAgICAgICAgICAgICAgICAgYnJlYWs7Cj4gICAgMzg1ICAgICAgICAgIH0K
PiAgICAzODYgIAo+ICAgIDM4NyAgICAgICAgICAvKgo+ICAgIDM4OCAgICAgICAgICAgKiBJZiBh
biBlcnJvciBoYXBwZW5lZCwgd2UgcHJvYmFibHkgZ290IGludGVycnVwdGVkIGFuZCB0aGUgZXhj
aGFuZ2UKPiAgICAzODkgICAgICAgICAgICogdGltZWRvdXQuIEluIHRoaXMgY2FzZSB3ZSBqdXN0
IGRyb3AgZXZlcnl0aGluZywgZW1pdCBhIHN0b3AgYW5kIHdhaXQKPiAgICAzOTAgICAgICAgICAg
ICogZm9yIHRoZSBzbGF2ZSB0byBpbnRlcnJ1cHQgYWdhaW4uCj4gICAgMzkxICAgICAgICAgICAq
Lwo+ICAgIDM5MiAgICAgICAgICBpZiAoc3ZjX2kzY19tYXN0ZXJfZXJyb3IobWFzdGVyKSkgewo+
ICAgIDM5MyAgICAgICAgICAgICAgICAgIGlmIChtYXN0ZXItPmliaS50YnFfc2xvdCkgewo+ICAg
IDM5NCAgICAgICAgICAgICAgICAgICAgICAgICAgZGF0YSA9IGkzY19kZXZfZ2V0X21hc3Rlcl9k
YXRhKGRldik7Cj4gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgXl5eCj4gRGVyZWZlcmVuY2VkIGhlcmUuCgpPbmx5IHN2Y19pM2Nf
bWFzdGVyX2hhbmRsZV9pYmkoKSBwb3B1bGF0ZXMgbWFzdGVyLT5pYmkudGJxX3Nsb3QsIHNvIGRl
dgp3aWxsIG9ubHkgYmUgZGVyZWZlcmVuY2VkIGlmIHN2Y19pM2NfbWFzdGVyX2hhbmRsZV9pYmko
KSB3YXMgZXhlY3V0ZWQsCndoaWNoIG9ubHkgaGFwcGVucyBpZiBkZXYgaXMgdmFsaWQuCgpJIGRv
bid0IHRoaW5rIHRoZXJlIGlzIGEgcmlzayBoZXJlLCBob3dldmVyIGlmIHJvYm90cyByZWFsbHkg
YXJlCnVuaGFwcHkgd2UgbWlnaHQgYWRkIGFuIGV4dHJhIHNhbml0eSBsZXZlbCBieSBjaGVja2lu
ZyBkZXYgZXhwbGljaXRseSwKYnV0IHRoaXMgd291bGQgYmUgcHVyZWx5IHVzZWxlc3Mgb24gYSBw
cmFjdGljYWwgcG9pbnQgb2Ygdmlldy4KClRoYW5rcywKTWlxdcOobAoKLS0gCmxpbnV4LWkzYyBt
YWlsaW5nIGxpc3QKbGludXgtaTNjQGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmlu
ZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1pM2MK
