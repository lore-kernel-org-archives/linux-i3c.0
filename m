Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 67891C61DBE
	for <linux-i3c@archiver.kernel.org>; Wed, 26 Aug 2026 10:52:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:
	References:In-Reply-To:Cc:To:Subject:From:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=OYoOKcuHiCwiuKgupmBPpz05zhp+WOI+nxM0vSHvpwI=; b=N9MpmpQcfpqhId
	QMibt+OCBa/I+BWpvGl0oe/WiX8T343j4JqHbqbUle2dXBcqDNf3IaisJ12+akLGDGDu5EVU/2z/J
	Fcv1xZh8lgRcwiNQjvbFbZ/JvTrt88BbkB2GzQfXlB5GLVql0qytmCw0OYAdCklNL+OkUUeYX0ty+
	254cfEOpFcxOIMrdS3wTbC/Daeic0W1nxyF6paGaMJKZ7Tc7xrhSZ9Xcy0grGm5ievG/Rw7xaw7F5
	l7TXQWDfi/QYDb+glpc6PHQMVvctMJB554UG1JR7KPHVv/5789LVmWnDMbDdryRR41HHAQTJHuy4H
	a1npISZdJp77XGmB+Xxw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wzBFM-00000002K1G-0UEW;
	Wed, 26 Aug 2026 10:52:44 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wzBFL-00000002K1A-0lwx
	for linux-i3c@lists.infradead.org;
	Wed, 26 Aug 2026 10:52:43 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 9AB49601E9;
	Wed, 26 Aug 2026 10:52:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E2BF91F000E9;
	Wed, 26 Aug 2026 10:52:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787741562;
	bh=abZ99My9Qae/qtii2IQ4mJ0HjFfZtD/2RL9o4UAtJ5w=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=SWAfIOsBePrtq4vmnGb9PifQxA/N0Up2Cyc8qWJCkAE5mD5drTpQijA2FZs+IHrCK
	 FpeXHgrhF3ZKdXdANUoDXUSZckt0Jf27C98URk2Y0tR5z+LX0D6fHWRoR5yC8H3Kha
	 7e0EEnW1ceBLAKZZTWUFLnU8uSRCZ+YFCq9JMu2VhHprzgcSPmMdDZC53x+8idOLDG
	 jH/NBCKKqZ/jX9X/5CfA5r4pxMZmgu89LKpBECePK5RtIIU+kCjcg950/LnpiDshWi
	 XorfAOIYtsc+K3WHYyzurp2Zh3XaU9wkBl72FCExhy2OgX17vV9nX8yuvWKGcJGupW
	 SuRmWdSJfcuEQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v16 1/8] i3c: master: Add APIs for I3C hub support
To: "Lakshay Piplani" <lakshay.piplani@nxp.com>
Cc: robh@kernel.org, conor+dt@kernel.org, "Alexandre Belloni" <alexandre.belloni@bootlin.com>, Frank.Li@kernel.org, linux-i3c@lists.infradead.org, devicetree@vger.kernel.org
In-Reply-To: <20260826103819.1614843-2-lakshay.piplani@nxp.com>
References: <20260826103819.1614843-1-lakshay.piplani@nxp.com>
 <20260826103819.1614843-2-lakshay.piplani@nxp.com>
Date: Wed, 26 Aug 2026 10:52:41 +0000
Message-Id: <20260826105241.E2BF91F000E9@smtp.kernel.org>
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
IFtIaWdoXSBGYWlsdXJlIGluIGkzY19idXNfaW5pdCgpIGNhdXNlcyBpM2NfbWFzdGVyZGV2X3Jl
bGVhc2UoKSB0byBlcnJvbmVvdXNseSByZW1vdmUgSUQgMCBmcm9tIHRoZSBJRFIuCi0tCgpjb21t
aXQgMWYwODllMzE0MWY1YTYzNWRmMzNkMjI3M2Q3ZGUyMTE0YjJmNmVmNQpBdXRob3I6IEFtYW4g
S3VtYXIgUGFuZGV5IDxhbWFuLmt1bWFycGFuZGV5QG54cC5jb20+CgogICAgaTNjOiBtYXN0ZXI6
IEFkZCBBUElzIGZvciBJM0MgaHViIHN1cHBvcnQKICAgIAogICAgQWRkIENDQyBoZWxwZXJzIHRv
IGNoZWNrIENDQyBzdXBwb3J0IGFuZCBzZW5kIENDQyBjb21tYW5kcywgYWRkcmVzcyBzbG90CiAg
ICBoZWxwZXJzIHRvIHF1ZXJ5IGFuZCB1cGRhdGUgSTNDIGJ1cyBhZGRyZXNzIHNsb3Qgc3RhdGUs
IHJlZ2lzdGVyaW5nIHZpcnR1YWwKICAgIG1hc3RlcnMgd2l0aCBhbiBleHBsaWNpdCBmaXJtd2Fy
ZSBub2RlLCBhbmQgZXhwb3NpbmcgdGhlIGJ1cyBtYWludGVuYW5jZQogICAgbG9jayBoZWxwZXJz
LgoKPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9pM2MvbWFzdGVyLmMgYi9kcml2ZXJzL2kzYy9tYXN0
ZXIuYwo+IGluZGV4IGYxYmUzOGE2NDBjYTEuLjAzZmI0MWYwNzg2YzUgMTAwNjQ0Cj4gLS0tIGEv
ZHJpdmVycy9pM2MvbWFzdGVyLmMKPiArKysgYi9kcml2ZXJzL2kzYy9tYXN0ZXIuYwoKWyAuLi4g
XQoKPiBAQCAtMzE5NSwzNCArMzI2NywzMSBAQCBzdGF0aWMgaW50IGkzY19tYXN0ZXJfY2hlY2tf
b3BzKGNvbnN0IHN0cnVjdCBpM2NfbWFzdGVyX2NvbnRyb2xsZXJfb3BzICpvcHMpCj4gIH0KPiAg
Cj4gIC8qKgo+IC0gKiBpM2NfbWFzdGVyX3JlZ2lzdGVyKCkgLSByZWdpc3RlciBhbiBJM0MgbWFz
dGVyCj4gKyAqIGkzY19tYXN0ZXJfcmVnaXN0ZXJfZndub2RlKCkgLSByZWdpc3RlciBhbiBJM0Mg
bWFzdGVyIHdpdGggYSBjdXN0b20gZndub2RlCj4gICAqIEBtYXN0ZXI6IG1hc3RlciB1c2VkIHRv
IHNlbmQgZnJhbWVzIG9uIHRoZSBidXMKPiAtICogQHBhcmVudDogdGhlIHBhcmVudCBkZXZpY2Ug
KHRoZSBvbmUgdGhhdCBwcm92aWRlcyB0aGlzIEkzQyBtYXN0ZXIKPiAtICoJICAgIGNvbnRyb2xs
ZXIpCj4gKyAqIEBwYXJlbnQ6IHRoZSBwYXJlbnQgZGV2aWNlIHByb3ZpZGluZyB0aGlzIEkzQyBt
YXN0ZXIgY29udHJvbGxlcgo+ICsgKiBAZndub2RlOiBmaXJtd2FyZSBub2RlIGRlc2NyaWJpbmcg
dGhpcyBJM0MgYnVzLCBvciBOVUxMCj4gICAqIEBvcHM6IHRoZSBtYXN0ZXIgY29udHJvbGxlciBv
cGVyYXRpb25zCj4gLSAqIEBzZWNvbmRhcnk6IHRydWUgaWYgeW91IGFyZSByZWdpc3RlcmluZyBh
IHNlY29uZGFyeSBtYXN0ZXIuIFdpbGwgcmV0dXJuCj4gLSAqCSAgICAgICAtRU9QTk9UU1VQUCBp
ZiBzZXQgdG8gdHJ1ZSBzaW5jZSBzZWNvbmRhcnkgbWFzdGVycyBhcmUgbm90IHlldAo+IC0gKgkg
ICAgICAgc3VwcG9ydGVkCj4gKyAqIEBzZWNvbmRhcnk6IHRydWUgaWYgcmVnaXN0ZXJpbmcgYSBz
ZWNvbmRhcnkgbWFzdGVyCgpbIC4uLiBdCgo+IEBAIC0zMzUyLDYgKzM0MjcsMzkgQEAgaW50IGkz
Y19tYXN0ZXJfcmVnaXN0ZXIoc3RydWN0IGkzY19tYXN0ZXJfY29udHJvbGxlciAqbWFzdGVyLAo+
ICAKPiAgCXJldHVybiByZXQ7Cj4gIH0KPiArRVhQT1JUX1NZTUJPTF9HUEwoaTNjX21hc3Rlcl9y
ZWdpc3Rlcl9md25vZGUpOwoKW1NldmVyaXR5OiBIaWdoXQpUaGlzIGlzIGEgcHJlLWV4aXN0aW5n
IGlzc3VlLCBidXQgY2FuIGEgZmFpbHVyZSBpbiBpM2NfYnVzX2luaXQoKSBjYXVzZQppM2NfbWFz
dGVyZGV2X3JlbGVhc2UoKSB0byBlcnJvbmVvdXNseSByZW1vdmUgSUQgMCBmcm9tIHRoZSBJRFI/
CgpJZiBpZHJfYWxsb2MoKSBmYWlscyBpbiBpM2NfYnVzX2luaXQoKSwgaTNjYnVzLT5pZCByZW1h
aW5zIDAuIFRoZSBlcnJvcgpwYXRoIGluIGkzY19tYXN0ZXJfcmVnaXN0ZXJfZndub2RlKCkgYnJh
bmNoZXMgdG8gZXJyX3B1dF9kZXYsIGNhbGxpbmcKcHV0X2RldmljZSgpLCB3aGljaCBpbnZva2Vz
IGkzY19tYXN0ZXJkZXZfcmVsZWFzZSgpIGFuZCB1bmNvbmRpdGlvbmFsbHkKY2FsbHMgaTNjX2J1
c19jbGVhbnVwKCkuCgpUaGlzIGV4ZWN1dGVzIGlkcl9yZW1vdmUoJmkzY19idXNfaWRyLCAwKSwg
cmVtb3Zpbmcgd2hhdGV2ZXIgdmFsaWQgYnVzCmhhcHBlbnMgdG8gb3duIElEIDAuIFRoaXMgY29y
cnVwdHMgdGhlIElEUiwgYnJlYWtpbmcgYnVzIGxvb2t1cHMgZm9yIGJ1cyAwCmFuZCBwb3RlbnRp
YWxseSBsZWFkaW5nIHRvIGEgdXNlLWFmdGVyLWZyZWUgb3IgYSBkb3VibGUgYWxsb2NhdGlvbiBv
ZiBJRCAwCmxhdGVyLgoKLS0gClNhc2hpa28gQUkgcmV2aWV3IMK3IGh0dHBzOi8vc2FzaGlrby5k
ZXYvIy9wYXRjaHNldC8yMDI2MDgyNjEwMzgxOS4xNjE0ODQzLTEtbGFrc2hheS5waXBsYW5pQG54
cC5jb20/cGFydD0xCgotLSAKbGludXgtaTNjIG1haWxpbmcgbGlzdApsaW51eC1pM2NAbGlzdHMu
aW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZv
L2xpbnV4LWkzYwo=
