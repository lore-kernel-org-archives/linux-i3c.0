Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8CE8BEFCD9F
	for <linux-i3c@archiver.kernel.org>; Tue, 10 Mar 2026 09:07:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Gwe7S3mZCvg2MKY58ZvI94jRYt+PrARy91grWV1X07I=; b=jeUL/g32dX4X/r
	kZL3HfomBQMS4SlrcskaSLjOkGw4KDgRtlwGc8FMlrWSltAYqtfNDJ58+Lu/D2/FtNKLxFEsz5GKh
	wh/LuVVr3RSxrleBbjWMzAKd+zwoHzDOpOzHfPonDo9XAxGEhsd0YqVVsR6R7n0tHgf2QZGPo+vT4
	5+5FVWiOzsOAd0PcXUPt8jto1tO6ndJw3MsAzjopBPJphnitaRIJWUpWDGdF2k0zY3fPogBy8wsvu
	iGdnqwgJ/DmnDSGpXUfhX76FCSU6G1QZxW/24Q1hfFyIiPMmly/Lvnxso9zcHz5oS3l1ynOmUzdvf
	EUpV+zdhrzrz97AoLmGA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vzt3a-000000092Ii-1FOY;
	Tue, 10 Mar 2026 09:07:14 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vzt3W-000000092I3-1kc7
	for linux-i3c@lists.infradead.org;
	Tue, 10 Mar 2026 09:07:12 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id CAD914441A;
	Tue, 10 Mar 2026 09:07:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C442EC19423;
	Tue, 10 Mar 2026 09:07:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773133629;
	bh=6eF/vyj+PRCxc6lfmhanPayw01TYRPT0Stz46J6EG6M=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=MdCO3C2aGVqEDav5yVjYdfmoITBDdAeWmj9PVxtFy5j1sFDcc6DkwNis+TiXWv8bd
	 JjfS4ZWlOIHOSkDdxd53ggvX51kUImU0xxl3NBSSbUm17k1/5/F1xlIeNjiWKPDrNz
	 FV4oyqOrGsrRn159Xldu2OrbZKaLyz3LIflPumuTjTKWhslTrl/lLZq1oG5jhcC3yE
	 XxD+thqzN7nxEiuJQ1DwcIv+W6Vr8ctH+Lx75E3YZx7XmQIAzzKSAEwOcOEqXawVC5
	 vtrag/R7Gh5izBd8Fikd4To3aZmkFsA95DrLW3HzGVOtB0/j5gfhmLqlN1UtoeAffu
	 Nymv4olm6y9Cg==
Date: Tue, 10 Mar 2026 09:07:03 +0000
From: Lee Jones <lee@kernel.org>
To: Lakshay Piplani <lakshay.piplani@nxp.com>
Cc: linux-kernel@vger.kernel.org, linux-i3c@lists.infradead.org,
	alexandre.belloni@bootlin.com, krzk+dt@kernel.org, robh@kernel.org,
	conor+dt@kernel.org, devicetree@vger.kernel.org, broonie@kernel.org,
	Frank.Li@nxp.com, lgirdwood@gmail.com, vikash.bansal@nxp.com,
	priyanka.jain@nxp.com, aman.kumarpandey@nxp.com
Subject: Re: [PATCH v6 7/7] i3c: hub: p3h2x4x: Add support for NXP P3H2x4x
 I3C hub functionality
Message-ID: <20260310090703.GB183676@google.com>
References: <20260310065727.3759342-1-lakshay.piplani@nxp.com>
 <20260310065727.3759342-7-lakshay.piplani@nxp.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260310065727.3759342-7-lakshay.piplani@nxp.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260310_020710_474960_A2113E53 
X-CRM114-Status: GOOD (  10.00  )
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

T24gVHVlLCAxMCBNYXIgMjAyNiwgTGFrc2hheSBQaXBsYW5pIHdyb3RlOgoKPiBGcm9tOiBBbWFu
IEt1bWFyIFBhbmRleSA8YW1hbi5rdW1hcnBhbmRleUBueHAuY29tPgo+IAo+IEFkZCBJM0MgaHVi
IGZ1bmN0aW9uYWxpdHkgZm9yIHRoZSBOWFAgUDNIMng0eCBmYW1pbHkgb2YgbXVsdGlwb3J0IGh1
YnMuCj4gVGhlc2UgZGV2aWNlcyBzdXBwb3J0IGRvd25zdHJlYW0gdGFyZ2V0IHBvcnRzIHRoYXQg
Y2FuIGJlIGNvbmZpZ3VyZWQKPiBhcyBJM0MsIEkyQywgb3IgU01CdXMuCj4gCj4gVGhpcyBkcml2
ZXIgZW5hYmxlczoKPiAtIEkzQy9JMkMgY29tbXVuaWNhdGlvbiBiZXR3ZWVuIGhvc3QgYW5kIGh1
Ygo+IC0gVHJhbnNwYXJlbnQgY29tbXVuaWNhdGlvbiB3aXRoIGRvd25zdHJlYW0gZGV2aWNlcwo+
IC0gVGFyZ2V0IHBvcnQgY29uZmlndXJhdGlvbiAoSTNDL0kyQy9TTUJ1cykKPiAtIE1DVFAgZGV2
aWNlIHN1cHBvcnQKPiAtIEluLWJhbmQgaW50ZXJydXB0IGhhbmRsaW5nCj4gCj4gUDNIMjQ0MC9Q
M0gyNDQxIHN1cHBvcnQgNCB0YXJnZXQgcG9ydHMuCj4gUDNIMjg0MC9QM0gyODQxIHN1cHBvcnQg
OCB0YXJnZXQgcG9ydHMuCj4gCj4gU2lnbmVkLW9mZi1ieTogQW1hbiBLdW1hciBQYW5kZXkgPGFt
YW4ua3VtYXJwYW5kZXlAbnhwLmNvbT4KPiBTaWduZWQtb2ZmLWJ5OiBWaWthc2ggQmFuc2FsIDx2
aWthc2guYmFuc2FsQG54cC5jb20+Cj4gU2lnbmVkLW9mZi1ieTogTGFrc2hheSBQaXBsYW5pIDxs
YWtzaGF5LnBpcGxhbmlAbnhwLmNvbT4KCldoZXJlIGlzIHlvdXIgY292ZXIgbGV0dGVyPwoKV2h5
IGRpZCBJIGhhdmUgdG8gc2NvdXIgNyBwYXRjaGVzIGp1c3QgdG8gZmluZCBvdXQgdGhhdCB0aGVy
ZSBpcyBub3RoaW5nCmZvciBtZSB0byBkbyBhbmQgdGhhdCBJIHNob3VsZG4ndCBoYXZlIGJlZW4g
c2VudCB0aGUgc2V0IGluIHRoZSBmaXJzdApwbGFjZT8KClBsZWFzZSBwcm92aWRlIGNvdmVyIGxl
dHRlcnMgZm9yIGxhcmdlIHNldHMgbGlrZSB0aGlzLgoKLS0gCkxlZSBKb25lcyBb5p2O55C85pav
XQoKLS0gCmxpbnV4LWkzYyBtYWlsaW5nIGxpc3QKbGludXgtaTNjQGxpc3RzLmluZnJhZGVhZC5v
cmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1pM2MK
