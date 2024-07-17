Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 965A5C3DA42
	for <linux-i3c@archiver.kernel.org>; Wed, 17 Jul 2024 07:56:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=yv/B7gbMXoY1MRU0FmmIBIjlvTm3nYw+0emet5g4s/Q=; b=KkJ7K6qD0kx877
	4OfXkWmOeJg/fTKnlYCFh5OBlWIlAGpGo4hZBNHUxCtGchCRxPqcpxeRcqQghNXwCjX22Dmob59k/
	zjL+XDcVIWTn1mWkLo2puvc1ijHlqym/jb9h0EkUTMKsSqEIYWyj8bgEzA4hNhMqobrDnRbbCN22y
	dvDBZFG8voovJW/S1z/WUMx/wlEIw9UFM+pi5YGoZ3DrAPh20kV2BEkWwXp0Nh6Ljow8RZTLM+god
	by1d5BzbtZBlK9MWU4+hCWHqT3YVhH7NB7Y5xunp/H/HWNG83b8ZUm95RZd8ihZzk9TYRm7iWUnGO
	9bgNM6oYH3alPed6R4zA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sTzWp-0000000D2vD-3W9C;
	Wed, 17 Jul 2024 07:56:47 +0000
Received: from relay6-d.mail.gandi.net ([2001:4b98:dc4:8::226])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sTzWb-0000000D2sU-1kc1
	for linux-i3c@lists.infradead.org;
	Wed, 17 Jul 2024 07:56:45 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 27C88C0002;
	Wed, 17 Jul 2024 07:56:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1721202989;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=urZJ1/84wIytql9BIcugNB1IyCTILe2NsmTy/SWnd4M=;
	b=pxpGccybf6wrT60Y6gYN4tEb20R8rqUM/wWxuNqafOpanLoLTBtCSy2kUcnKmkEUwI7yl5
	SjNcy3cc/b2hvahovJe6IxQNE9G/Z6q89oma+DoHH/YbN97Q1i9+bKgIpNnjHG03iM/yyj
	cuUkEPCR/Yk2k6HsxpfWH+QQQ9akby9ZorzJseYPe0jHm+AauVtKKbpDF9UIST39yD736Y
	mmLebk0mk9fqvd7SH64kde7OdVNEQJP4VlZvwQ+wJs+0yF2vxPOGrpx4YENByPl/H13XcR
	a6TOpN8CVvFo/KDHZDvQRHLNumVGW+ckZqTOnQbHMNXOcFnhP+DyeeM8CD0KoA==
Date: Wed, 17 Jul 2024 09:56:26 +0200
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Frank Li <Frank.Li@nxp.com>
Cc: Conor Culhane <conor.culhane@silvaco.com>, Alexandre Belloni
 <alexandre.belloni@bootlin.com>, linux-i3c@lists.infradead.org (moderated
 list:SILVACO I3C DUAL-ROLE MASTER), linux-kernel@vger.kernel.org (open
 list), imx@lists.linux.dev
Subject: Re: [PATCH 1/1] i3c: master: svc: adjust SDR timing according to
 i3c spec
Message-ID: <20240717095626.278d6e62@xps-13>
In-Reply-To: <20240712164602.3600659-1-Frank.Li@nxp.com>
References: <20240712164602.3600659-1-Frank.Li@nxp.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: miquel.raynal@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240717_005633_632189_095C6CEA 
X-CRM114-Status: UNSURE (   5.82  )
X-CRM114-Notice: Please train this message.
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

SGkgRnJhbmssCgpGcmFuay5MaUBueHAuY29tIHdyb3RlIG9uIEZyaSwgMTIgSnVsIDIwMjQgMTI6
NDY6MDIgLTA0MDA6Cgo+IEZyb206IENhcmxvcyBTb25nIDxjYXJsb3Muc29uZ0BueHAuY29tPgo+
IAo+IEFjY29yZGluZyB0byBJM0MgU3BlY2lmaWNhdGlvbihWZXJzaW9uIDEuMSkgNS4xLjIuNCAi
VXNlIG9mIENsb2NrCj4gU3BlZWQgdG8gUHJldmVudCBMZWdhY3kgSTJDIERldmljZXMgRnJvbSBT
ZWVpbmcgSTNDIHRyYWZmaWMiLCB3aGVuCj4gc2xvdyBpMmMgZGV2aWNlcyhGTS9GTSsgcmF0ZSBp
MmMgZnJlcXVlbmN5IHdpdGhvdXQgNTBucyBmaWx0ZXIpCj4gd29ya3Mgb24gaTNjIGJ1cywgaTNj
IFNEUiBzaG91bGQgd29yayBhdCBGTS9GTSsgcmF0ZS4KPiAKPiBBZGp1c3QgdGltaW5nIGZvciBk
aWZmZXJlbmNlIG1vZGUuCgpUaGUgY2FsY3VsYXRpb25zIGJlbG93IGxvb2sgcXVpdGUgY29tcGxl
eCwgYnV0IGlmIHlvdSBiZWxpZXZlIHRoaXMgaXMKcmlnaHQsIEknbSBmaW5lIHdpdGggaXQuCgpB
Y2tlZC1ieTogTWlxdWVsIFJheW5hbCA8bWlxdWVsLnJheW5hbEBib290bGluLmNvbT4KCj4gCj4g
U2lnbmVkLW9mZi1ieTogQ2xhcmsgV2FuZyA8eGlhb25pbmcud2FuZ0BueHAuY29tPgo+IFNpZ25l
ZC1vZmYtYnk6IENhcmxvcyBTb25nIDxjYXJsb3Muc29uZ0BueHAuY29tPgo+IFNpZ25lZC1vZmYt
Ynk6IEZyYW5rIExpIDxGcmFuay5MaUBueHAuY29tPgo+IC0tLQoKVGhhbmtzLApNaXF1w6hsCgot
LSAKbGludXgtaTNjIG1haWxpbmcgbGlzdApsaW51eC1pM2NAbGlzdHMuaW5mcmFkZWFkLm9yZwpo
dHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LWkzYwo=
