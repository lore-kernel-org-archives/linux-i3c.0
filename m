Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 25B23C9832A
	for <linux-i3c@archiver.kernel.org>; Tue, 29 Sep 2026 06:46:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:
	References:In-Reply-To:Cc:To:Subject:From:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=44sFJDsInPmjGoHy3N7I3hrfRfH40IxCNDHRm9Yea2I=; b=TtNWVZKI7/Ghh/
	6kcKaDEpWtjAWx9Fj6cl7DQypAsrnIkODYfoZLkA+B6nhACLXGO9U2AeXCy8esb8WysUlDKonJALP
	CjfS+Cytkc2Tj2FU/IsTiXZSRCTfPLAhbAo0CmVmrXjkH8mwiHY0mn7impSdHGsit5TsIs+NxUNRL
	HD4ue4xwXqu1/LtQwt3NhHVH4BbXvj/1dXKdJvIxYJdDm2dAmn/ZsTFW/vYqOYz7g67wVOJXq7Fix
	VsWTk3i67valNPceMGELEH/JvcqmKbZTyQ2jbfSWRcPwqcewiDPWI86sjYEg4fB42NnDQP0SWLzbr
	kYtF4yn3ojLmPPhWh3Sw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBRbG-00000002WQ4-3a2p;
	Tue, 29 Sep 2026 06:46:02 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBRbE-00000002WPg-3jKB
	for linux-i3c@lists.infradead.org;
	Tue, 29 Sep 2026 06:46:00 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 0E75360210;
	Tue, 29 Sep 2026 06:46:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 30B3B1F000FF;
	Tue, 29 Sep 2026 06:45:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790664359;
	bh=IZHhgJLjo25dJ1nkN562Lxo3SiA7EGsmeTRlINNKXyo=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=iCmz6rm2zcty76eQxqx5T5eVNZ+fta7FCDlZh6KMb7/W7sbUZhIrTGwwQ8tolfUOU
	 FEX3XgF6X3X/s4par6iuSsj2UJ68JsrPNRJIi4soXxh25y9cqJC5bkB30pOuAs3t+e
	 hKCOhREGphrI1djSf8VNPZUTjO/7GliZYdsPzzRPNK7Q07xKY5wYpadhjhIDh8blYf
	 7LVdLpRwpt3CJu4gxCLUgS37nkf3vnFzZPodxSXaZ1PBfxHczV6YQcduVtgoV58t4p
	 eR1GO3imlg9qxQzx9Q/sXyfiM0VEdFEWu6fFeVugHslMT82wU9nd8plxW+u2hby2EV
	 CgFNIzabdoGVg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 17/20] dt-bindings: mfd: Add Synaptics SL261x global
 block binding
To: "Jisheng Zhang" <jszhang@kernel.org>
Cc: mfd@lists.linux.dev, linux-i3c@lists.infradead.org, linux-serial@vger.kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org, lee@kernel.org, linux-clk@vger.kernel.org, Frank.Li@kernel.org, "Alexandre
 Belloni" <alexandre.belloni@bootlin.com>, robh@kernel.org
In-Reply-To: <20260929061417.20733-18-jszhang@kernel.org>
References: <20260929061417.20733-1-jszhang@kernel.org>
 <20260929061417.20733-18-jszhang@kernel.org>
Date: Tue, 29 Sep 2026 06:45:58 +0000
Message-Id: <20260929064559.30B3B1F000FF@smtp.kernel.org>
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
MSBwb3RlbnRpYWwgaXNzdWUocykgdG8gY29uc2lkZXI6Ci0gW0xvd10gZHQtYmluZGluZ3M6IG1m
ZDogaGFyZGNvZGVkIGNoaWxkIG5vZGUgbmFtZXMgcmVqZWN0IHN0YW5kYXJkIGdlbmVyaWMgbmFt
ZXMKLS0KCmNvbW1pdCAwNjc2YWFhMDZhNDRiNmIxNzFiZjBjM2IyOTVhMTRmNjgyMGMyMmQ0CkF1
dGhvcjogSmlzaGVuZyBaaGFuZyA8anN6aGFuZ0BrZXJuZWwub3JnPgoKZHQtYmluZGluZ3M6IG1m
ZDogQWRkIFN5bmFwdGljcyBTTDI2MXggZ2xvYmFsIGJsb2NrIGJpbmRpbmcKClRoaXMgY29tbWl0
IGludHJvZHVjZXMgdGhlIGRldmljZSB0cmVlIGJpbmRpbmcgZm9yIFN5bmFwdGljcyBTTDI2MXgg
Z2xvYmFsCmFuZCBjb250cm9sIHJlZ2lzdGVyIGJsb2Nrcy4gSXQgZGVmaW5lcyBjb25zdHJhaW50
cyBmb3IgdGhlIEFWSU8gZ2xvYmFsLApDUFUgd3JhcHBlciwgY2hpcCBjb250cm9sLCBhbmQgTUNV
IGdsb2JhbCBibG9ja3MsIGV4cG9zaW5nIGNsb2NrcywgcGluY3RybCwKYW5kIHJlc2V0IGZ1bmN0
aW9ucy4KCj4gZGlmZiAtLWdpdCBhL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9t
ZmQvc3luYSxzbDI2MXgtZ2JsLnlhbWwgYi9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGlu
Z3MvbWZkL3N5bmEsc2wyNjF4LWdibC55YW1sCj4gbmV3IGZpbGUgbW9kZSAxMDA2NDQKPiBpbmRl
eCAwMDAwMDAwMDAwMDAwLi4zZTU4NDIxNjljNGEzCj4gLS0tIC9kZXYvbnVsbAo+ICsrKyBiL0Rv
Y3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9tZmQvc3luYSxzbDI2MXgtZ2JsLnlhbWwK
WyAuLi4gXQo+ICtwcm9wZXJ0aWVzOgpbIC4uLiBdCj4gKyAgcmVnOgo+ICsgICAgbWF4SXRlbXM6
IDEKPiArCj4gKyAgY2xvY2s6Cj4gKyAgICB0eXBlOiBvYmplY3QKPiArICAgIGFkZGl0aW9uYWxQ
cm9wZXJ0aWVzOiB0cnVlCj4gKwo+ICsgIHBpbi1jb250cm9sbGVyOgo+ICsgICAgdHlwZTogb2Jq
ZWN0Cj4gKyAgICBhZGRpdGlvbmFsUHJvcGVydGllczogdHJ1ZQo+ICsKPiArICByZXNldDoKPiAr
ICAgIHR5cGU6IG9iamVjdAo+ICsgICAgYWRkaXRpb25hbFByb3BlcnRpZXM6IHRydWUKCltTZXZl
cml0eTogTG93XQpEb2VzIGVuZm9yY2luZyB0aGVzZSBleGFjdCBub2RlIG5hbWVzIHByZXZlbnQg
ZGV2aWNldHJlZSBhdXRob3JzIGZyb20gdXNpbmcKc3RhbmRhcmQgZ2VuZXJpYyBub2RlIG5hbWVz
IGxpa2UgY2xvY2stY29udHJvbGxlciBvciByZXNldC1jb250cm9sbGVyPwoKWyAuLi4gXQo+ICsg
ICAgICAgIHJlc2V0Ogo+ICsgICAgICAgICAgcHJvcGVydGllczoKPiArICAgICAgICAgICAgY29t
cGF0aWJsZToKPiArICAgICAgICAgICAgICBjb25zdDogc3luYSxzbDI2MXgtc3lzdGVtLXJlc2V0
Cj4gKwo+ICthZGRpdGlvbmFsUHJvcGVydGllczogZmFsc2UKCltTZXZlcml0eTogTG93XQpDb3Vs
ZCB0aGlzIHN0cmljdCB2YWxpZGF0aW9uIHJlamVjdCBkZXZpY2V0cmVlcyB1c2luZyBzdGFuZGFy
ZCBnZW5lcmljIG5hbWVzLApzaW5jZSBvbmx5IGNsb2NrLCBwaW4tY29udHJvbGxlciwgYW5kIHJl
c2V0IGFyZSBleHBsaWNpdGx5IGFsbG93ZWQgaW4gdGhlCnByb3BlcnRpZXMgYmxvY2s/CgpVc2lu
ZyBwYXR0ZXJuUHJvcGVydGllcyAoZS5nLiwgIl5jbG9jay1jb250cm9sbGVyKEAuKik/JCI6IHR5
cGU6IG9iamVjdCkKd291bGQgYWxsb3cgc3RhbmRhcmQgZGV2aWNldHJlZSBuYW1pbmcgY29udmVu
dGlvbnMuCgotLSAKU2FzaGlrbyBBSSByZXZpZXcgwrcgaHR0cHM6Ly9zYXNoaWtvLmRldi8jL3Bh
dGNoc2V0LzIwMjYwOTI5MDYxNDE3LjIwNzMzLTEtanN6aGFuZ0BrZXJuZWwub3JnP3BhcnQ9MTcK
Ci0tIApsaW51eC1pM2MgbWFpbGluZyBsaXN0CmxpbnV4LWkzY0BsaXN0cy5pbmZyYWRlYWQub3Jn
Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtaTNjCg==
