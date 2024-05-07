Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8765EC10F1A
	for <linux-i3c@archiver.kernel.org>; Tue,  7 May 2024 08:04:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=C1z0CW2zX3HoN5ubxvxU1jx8UmLTmuWAFJorsuqJ/24=; b=tjzdOzqHYM/JkY
	WmXc0labDeOeT8EmitO0ybN/ogAKHgvm5LcXqbTnGNgBFXWYjJOgg8zSG1YiinUmPMnnctGxaDyg1
	Nz71sH4vh+n1jFuoE43QKQua+bmeZOmX9cdMmGBo0y4AV8pJIVoWwO7Z1ZhXhXaHcnQSM3dHlVp3f
	rfzCYZ3WUaHFdhXA6YBI/23uORiTxMI1kQWm1hZXx1PgpvxsGL8b7HFJ2j1QfKe4JO3dvtEmACkxP
	sdquaXPPy9lvOfesafm6Znb9LUQXI0ojXNyNifSyy7gfbepnlhsVEAFJBBi1GQnAQgKmR/M5BWMAs
	AP4zOIJCZ6jL+ofQ22vw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s4FoN-0000000A4Y0-065r;
	Tue, 07 May 2024 08:04:31 +0000
Received: from relay3-d.mail.gandi.net ([2001:4b98:dc4:8::223])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s4FoK-0000000A4Wz-1z7a
	for linux-i3c@lists.infradead.org;
	Tue, 07 May 2024 08:04:30 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id DDC2060002;
	Tue,  7 May 2024 08:04:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1715069065;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=zsjTpPdQhp8xGYXA1tswPY/6gILWdgf1jxKsPkJpD10=;
	b=DBdTuImErvsqqyGScDzRjFP6Ovas2ZBQNaI3ew3vfdC+96+QHodwGpMNmeBcjkuS8qn+cb
	M2ELFwQoWEKVoK/tD2bfRNBtlzQiOMDxjAXfxkqAmtgdy0isoav5SA+rA8pAgv6dvTg6pS
	ijCrywnACX7Nyj2c0DG9hZQPLp965b8+JbK9BzdMyYvTOqeHFdKcWSDY4HjXrS0qAvIP69
	maeaj3TuseAdMJtr9YGK0D0+aEUBisgJ++0osrV46VsRW776IqCjrRUXu+untSJgFGL/Y0
	j6K0ui2o+/kLLdBQ/EabG0R/CeoLbcWzY64vuZCETVXIbRZL48IhC3StsbUXog==
Date: Tue, 7 May 2024 10:04:24 +0200
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Frank Li <Frank.Li@nxp.com>
Cc: alexandre.belloni@bootlin.com, conor.culhane@silvaco.com,
 imx@lists.linux.dev, linux-i3c@lists.infradead.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 3/3] i3c: master: svc: fix invalidate IBI type and
 miss call client IBI handler
Message-ID: <20240507100424.611181f1@xps-13>
In-Reply-To: <20240506164009.21375-3-Frank.Li@nxp.com>
References: <20240506164009.21375-1-Frank.Li@nxp.com>
	<20240506164009.21375-3-Frank.Li@nxp.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: miquel.raynal@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240507_010428_821351_1B34261C 
X-CRM114-Status: GOOD (  17.24  )
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

SGkgRnJhbmssCgpGcmFuay5MaUBueHAuY29tIHdyb3RlIG9uIE1vbiwgIDYgTWF5IDIwMjQgMTI6
NDA6MDkgLTA0MDA6Cgo+IEluIGFuIEluLUJhbmQgSW50ZXJydXB0IChJQkkpIGhhbmRsZSwgdGhl
IGNvZGUgbG9naWMgaXMgYXMgZm9sbG93czoKPiAKPiAxOiB3cml0ZWwoU1ZDX0kzQ19NQ1RSTF9S
RVFVRVNUX0FVVE9fSUJJIHwgU1ZDX0kzQ19NQ1RSTF9JQklSRVNQX0FVVE8sCj4gCSAgbWFzdGVy
LT5yZWdzICsgU1ZDX0kzQ19NQ1RSTCk7Cj4gCj4gMjogcmV0ID0gcmVhZGxfcmVsYXhlZF9wb2xs
X3RpbWVvdXQobWFzdGVyLT5yZWdzICsgU1ZDX0kzQ19NU1RBVFVTLCB2YWwsCj4gICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgU1ZDX0kzQ19NU1RBVFVTX0lCSVdPTih2YWwpLCAw
LCAxMDAwKTsKPiAJLi4uCj4gMzogaWJpdHlwZSA9IFNWQ19JM0NfTVNUQVRVU19JQklUWVBFKHN0
YXR1cyk7Cj4gICAgaWJpYWRkciA9IFNWQ19JM0NfTVNUQVRVU19JQklBRERSKHN0YXR1cyk7Cj4g
Cj4gU1ZDX0kzQ19NU1RBVFVTX0lCSVdPTiBtYXkgYmUgc2V0IGJlZm9yZSBzdGVwIDEuIFRodXMs
IHN0ZXAgMiB3aWxsIHJldHVybgo+IGltbWVkaWF0ZWx5LCBhbmQgdGhlIEkzQyBjb250cm9sbGVy
IGhhcyBub3Qgc2VudCBvdXQgdGhlIDl0aCBTQ0wgeWV0Lgo+IENvbnNlcXVlbnRseSwgaWJpdHlw
ZSBhbmQgaWJpYWRkciBhcmUgMCwgcmVzdWx0aW5nIGluIGFuIHVua25vd24gSUJJIHR5cGUKPiBv
Y2N1cnJlbmNlIGFuZCBtaXNzaW5nIGNhbGwgSTNDIGNsaWVudCBkcml2ZXIncyBJQkkgaGFuZGxl
ci4KPiAKPiBBIHR5cGljYWwgY2FzZSBpcyB0aGF0IFNWQ19JM0NfTVNUQVRVU19JQklXT04gaXMg
c2V0IHdoZW4gYW4gSUJJIG9jY3Vycwo+IGR1cmluZyB0aGUgY29udHJvbGxlciBzZW5kIHN0YXJ0
IGZyYW1lIGluIHN2Y19pM2NfbWFzdGVyX3hmZXIoKS4KPiAKPiBDbGVhciBTVkNfSTNDX01TVEFU
VVNfSUJJV09OIGJlZm9yZSBpc3N1ZSBTVkNfSTNDX01DVFJMX1JFUVVFU1RfQVVUT19JQkkKPiB0
byBmaXggdGhpcyBpc3N1ZS4KPiAKPiBDYzogc3RhYmxlQHZnZXIua2VybmVsLm9yZwo+IEZpeGVz
OiA1ZTVlM2M5MmU3NDggKCJpM2M6IG1hc3Rlcjogc3ZjOiBmaXggd3JvbmcgZGF0YSByZXR1cm4g
d2hlbiBJQkkgaGFwcGVuIGR1cmluZyBzdGFydCBmcmFtZSIpCj4gU2lnbmVkLW9mZi1ieTogRnJh
bmsgTGkgPEZyYW5rLkxpQG54cC5jb20+Cj4gLS0tCj4gCj4gTm90ZXM6Cj4gICAgIENoYW5nZSBm
cm9tIHYxIHRvIHYyCj4gICAgIC0gaW1wcm92ZSBjb21tZW50cy4KPiAKPiAgZHJpdmVycy9pM2Mv
bWFzdGVyL3N2Yy1pM2MtbWFzdGVyLmMgfCAxNiArKysrKysrKysrKysrLS0tCj4gIDEgZmlsZSBj
aGFuZ2VkLCAxMyBpbnNlcnRpb25zKCspLCAzIGRlbGV0aW9ucygtKQo+IAo+IGRpZmYgLS1naXQg
YS9kcml2ZXJzL2kzYy9tYXN0ZXIvc3ZjLWkzYy1tYXN0ZXIuYyBiL2RyaXZlcnMvaTNjL21hc3Rl
ci9zdmMtaTNjLW1hc3Rlci5jCj4gaW5kZXggOTRlNDk1NDUwOTU1OC4uMDMyZmUwMzJlYzQzMyAx
MDA2NDQKPiAtLS0gYS9kcml2ZXJzL2kzYy9tYXN0ZXIvc3ZjLWkzYy1tYXN0ZXIuYwo+ICsrKyBi
L2RyaXZlcnMvaTNjL21hc3Rlci9zdmMtaTNjLW1hc3Rlci5jCj4gQEAgLTQxNSw2ICs0MTUsMTkg
QEAgc3RhdGljIHZvaWQgc3ZjX2kzY19tYXN0ZXJfaWJpX3dvcmsoc3RydWN0IHdvcmtfc3RydWN0
ICp3b3JrKQo+ICAJaW50IHJldDsKPiAgCj4gIAltdXRleF9sb2NrKCZtYXN0ZXItPmxvY2spOwo+
ICsJLyoKPiArCSAqIElCSVdPTiBtYXkgYmUgc2V0IGJlZm9yZSBTVkNfSTNDX01DVFJMX1JFUVVF
U1RfQVVUT19JQkksIGNhdXNpbmcKPiArCSAqIHJlYWRsX3JlbGF4ZWRfcG9sbF90aW1lb3V0KCkg
dG8gcmV0dXJuIGltbWVkaWF0ZWx5LiBDb25zZXF1ZW50bHksCj4gKwkgKiBpYml0eXBlIHdpbGwg
YmUgMCBzaW5jZSBpdCB3YXMgbGFzdCB1cGRhdGVkIG9ubHkgYWZ0ZXIgdGhlIDh0aCBTQ0wKPiAr
CSAqIGN5Y2xlLCBsZWFkaW5nIHRvIG1pc3NlZCBjbGllbnQgSUJJIGhhbmRsZXJzLgo+ICsJICoK
PiArCSAqIEEgdHlwaWNhbCBzY2VuYXJpbyBpcyB3aGVuIElCSVdPTiBvY2N1cnMgYW5kIGJ1cyBh
cmJpdHJhdGlvbiBpcyBsb3N0Cj4gKwkgKiBhdCBzdmNfaTNjX21hc3Rlcl9wcml2X3hmZXJzKCku
Cj4gKwkgKgo+ICsJICogQ2xlYXIgU1ZDX0kzQ19NSU5UX0lCSVdPTiBiZWZvcmUgc2VuZGluZyBT
VkNfSTNDX01DVFJMX1JFUVVFU1RfQVVUT19JQkkuCj4gKwkgKi8KClRoYW5rcyBhIGxvdC4KClJl
dmlld2VkLWJ5OiBNaXF1ZWwgUmF5bmFsIDxtaXF1ZWwucmF5bmFsQGJvb3RsaW4uY29tPgoKVGhh
bmtzLApNaXF1w6hsCgotLSAKbGludXgtaTNjIG1haWxpbmcgbGlzdApsaW51eC1pM2NAbGlzdHMu
aW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZv
L2xpbnV4LWkzYwo=
