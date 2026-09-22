Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B0118C982F1
	for <linux-i3c@archiver.kernel.org>; Tue, 22 Sep 2026 10:44:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:
	References:In-Reply-To:Cc:To:Subject:From:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=JPVuD1xc5B0LW8tobr4Wq+j9I1N7PRb38gXv/50l7Ec=; b=geMBjk+yk4izsk
	fgvWu85z7JQoh4g/e79W2OXENBrhOXrCHaSMe9WfDxZG8xkwNJBfBptjnQajeKle9U370CA2ghw79
	3Diwtn2VaneL6qMuJdpiexAHgZO/GnicPtcZdc3Ytaf7Bcid1quZ4fU+zFRZAgh+0uXCMkjov1g8Y
	FEqZzOexuKtWgtnGu3XUbNW7z1c4nz5tzHcshKe83RovD+iT6C0nbz+XMlQW30N2TT9iqUBeahghd
	VzrOxlWrgx2+TljHetvF1S7k1y0xsh/CMtmwqNLJ8nfr9DBLKTQVSt7TxBckfqKGw8Y8r7taRlkpL
	leSVes+I5q3y2LS7d0bg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8xzV-000000055sf-1j0m;
	Tue, 22 Sep 2026 10:44:49 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8xzT-000000055sX-2C1k
	for linux-i3c@lists.infradead.org;
	Tue, 22 Sep 2026 10:44:47 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 9E5026021C;
	Tue, 22 Sep 2026 10:44:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D5C791F000FF;
	Tue, 22 Sep 2026 10:44:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790073886;
	bh=3aPUPivC4b5ZIJUXeU1itKnx1QmlawxrfLmx6rLqt7Q=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=Q2SsiAeW34O5majWfc/A/Z/Uh2w+n37JurYq/GHd/FUNIR0g3ZJ3z/gIARWNnstH2
	 n/9iDbwJc5Bys65jnBjPye9sXWBIFmXp6TZ+O4jkFy3aqPWg9vOOh2EbmPUgSRF5Jw
	 JKbDMLNHAii7kCEbh72oZeLX4XKgt2g2Yf3ITzWXs18yj+YvGYKEuz9p0V1qQd5L4A
	 MoZEpDiBHoq6j2BjmRuNjGaB5cpW4N6ygjGlsry4JMAZfxlcvd2UPQtJItO8cbLmLF
	 Qmq69hiYSzSQF4vt+lTl+qgYsWBqFhiMBblAd77VlH0Su5nf/9/oy2918IJySjjX9P
	 iZaCMrh2isOPQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v20 3/8] dt-bindings: i3c: Add NXP P3H2x4x i3c-hub
 support
To: "Lakshay Piplani" <lakshay.piplani@nxp.com>
Cc: lee@kernel.org, linux-i3c@lists.infradead.org, Frank.Li@kernel.org, devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org, mfd@lists.linux.dev, "Alexandre
 Belloni" <alexandre.belloni@bootlin.com>
In-Reply-To: <20260922103551.2754613-4-lakshay.piplani@nxp.com>
References: <20260922103551.2754613-1-lakshay.piplani@nxp.com>
 <20260922103551.2754613-4-lakshay.piplani@nxp.com>
Date: Tue, 22 Sep 2026 10:44:45 +0000
Message-Id: <20260922104445.D5C791F000FF@smtp.kernel.org>
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
MSBwb3RlbnRpYWwgaXNzdWUocykgdG8gY29uc2lkZXI6Ci0gW0xvd10gZHQtYmluZGluZ3M6IG1p
c3NpbmcgJ2NvbXBhdGlibGUnIGluIHRvcC1sZXZlbCByZXF1aXJlZCBsaXN0Ci0tCgpjb21taXQg
NGI3MDI2MWM4Y2U0MWU2NGM3MDIwZjQxYmIzMDg0ZjNkNzNkMGUwNwpBdXRob3I6IEFtYW4gS3Vt
YXIgUGFuZGV5IDxhbWFuLmt1bWFycGFuZGV5QG54cC5jb20+CiAgICAKZHQtYmluZGluZ3M6IGkz
YzogQWRkIE5YUCBQM0gyeDR4IGkzYy1odWIgc3VwcG9ydAogICAgClRoaXMgcGF0Y2ggYWRkcyBk
ZXZpY2UgdHJlZSBiaW5kaW5ncyBmb3IgdGhlIE5YUCBQM0gyeDR4IG11bHRpcG9ydCBJM0MgaHVi
CmZhbWlseS4gVGhlc2UgZGV2aWNlcyBjb25uZWN0IHRvIGEgaG9zdCB2aWEgSTNDL0kyQy9TTUJ1
cyBhbmQgYWxsb3cKY29tbXVuaWNhdGlvbiB3aXRoIG11bHRpcGxlIGRvd25zdHJlYW0gcGVyaXBo
ZXJhbHMuCgo+IGRpZmYgLS1naXQgYS9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3Mv
aTNjL254cCxwM2gyODQwLnlhbWwgYi9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3Mv
aTNjL254cCxwM2gyODQwLnlhbWwKPiBuZXcgZmlsZSBtb2RlIDEwMDY0NAo+IGluZGV4IDAwMDAw
MDAwMDAwMDAuLjA5NTA4YTdiY2JlYjYKPiAtLS0gL2Rldi9udWxsCj4gKysrIGIvRG9jdW1lbnRh
dGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL2kzYy9ueHAscDNoMjg0MC55YW1sCgpbIC4uLiBdCgo+
ICsgICAgICBsZG8tdHBnMToKPiArICAgICAgICB0eXBlOiBvYmplY3QKPiArICAgICAgICAkcmVm
OiAvc2NoZW1hcy9yZWd1bGF0b3IvcmVndWxhdG9yLnlhbWwjCj4gKyAgICAgICAgdW5ldmFsdWF0
ZWRQcm9wZXJ0aWVzOiBmYWxzZQo+ICsKPiArcmVxdWlyZWQ6Cj4gKyAgLSByZWcKPiArICAtICcj
YWRkcmVzcy1jZWxscycKPiArICAtICcjc2l6ZS1jZWxscycKCltTZXZlcml0eTogTG93XQpTaG91
bGQgdGhlIHRvcC1sZXZlbCBjb21wYXRpYmxlIHByb3BlcnR5IGJlIGluY2x1ZGVkIGluIHRoaXMg
cmVxdWlyZWQgbGlzdD8KClN0YW5kYXJkIGRldmljZSB0cmVlIGJpbmRpbmcgc2NoZW1hcyBleHBl
Y3QgdGhlIHRvcC1sZXZlbCBjb21wYXRpYmxlIHByb3BlcnR5CnRvIGJlIGV4cGxpY2l0bHkgbGlz
dGVkIGluIHRoZSByZXF1aXJlZCBhcnJheSBmb3Igc3RhbmRhbG9uZSBkZXZpY2Ugbm9kZXMuCkFs
dGhvdWdoIGR0LXNjaGVtYSBtYXRjaGVzIHRoZSBub2RlIGJ5IGNvbXBhdGlibGUgc3RyaW5nLCBv
bWl0dGluZyBpdCBmcm9tIHRoZQpyZXF1aXJlZCBsaXN0IGFsbG93cyBhIG5vZGUgdG8gdGhlb3Jl
dGljYWxseSBwYXNzIHZhbGlkYXRpb24gd2l0aG91dCBvbmUgaWYKcmVmZXJlbmNlZCB0aHJvdWdo
IG90aGVyIG1lYW5zLgoKPiArCj4gK3BhdHRlcm5Qcm9wZXJ0aWVzOgo+ICsgICJeaTNjQFswLTdd
JCI6Cj4gKyAgICB0eXBlOiBvYmplY3QKPiArICAgICRyZWY6IC9zY2hlbWFzL2kzYy9pM2MueWFt
bCMKCi0tIApTYXNoaWtvIEFJIHJldmlldyDCtyBodHRwczovL3Nhc2hpa28uZGV2LyMvcGF0Y2hz
ZXQvMjAyNjA5MjIxMDM1NTEuMjc1NDYxMy0xLWxha3NoYXkucGlwbGFuaUBueHAuY29tP3BhcnQ9
MwoKLS0gCmxpbnV4LWkzYyBtYWlsaW5nIGxpc3QKbGludXgtaTNjQGxpc3RzLmluZnJhZGVhZC5v
cmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1pM2MK
