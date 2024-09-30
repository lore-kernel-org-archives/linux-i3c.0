Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E9581CE8360
	for <linux-i3c@archiver.kernel.org>; Mon, 30 Sep 2024 16:22:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=IySzeW0cNYLTf4sTE+OeAV7uGhe+d3Q1L5ez8S9+yuE=; b=RKqzOpTAoVDNj/
	4PZnBtqpxJwy+ngI2sDvoGkB7DVU+Lwndlgqn3PqI0yfpHG4b8M6ok04fzpd/ztaJY+sGndz/Dyk4
	37AlIYJGhVV3MT/hgN/0cKngY5IhZ1JhGG5NU/5vWU/iGcDl1or64KMzncLsplPo4bI1U9vpDc6+H
	k+UonZbq7kIb6ZPgNJEjC/oMqHinu3iOZ2p1c81DetcwwgqYNYtGNI6baXDElddZetCJdtE1P6ygG
	3PY+bsSa5mip3co/3tjB9zrEaS4crSlODCNN8r+ZBP/An0isavj3RsDlNRzYF1sIt16mGlhYW+oeL
	t4AvZ0mqjYwtqlhZ23IQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1svJAc-00000000Dfo-0K0P;
	Mon, 30 Sep 2024 16:22:46 +0000
Received: from relay6-d.mail.gandi.net ([217.70.183.198])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1svJAZ-00000000DfS-0Vmp
	for linux-i3c@lists.infradead.org;
	Mon, 30 Sep 2024 16:22:45 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 52682C0003;
	Mon, 30 Sep 2024 16:22:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1727713359;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=AkPKgnAgbGFe7mgt13GeZjNd77h1Yl8R02uaedeP1eM=;
	b=TNh0q6+swvpWa7Kb1FK9mnp3NW5W/cAfiyiul6aouZrXgxzid52LiI0OcY1d7yKbQqEkpj
	CKgyGH8w4GbAH3xJJMwse4hwQpd46Ukc0Dp2DLEs0OAoBA2gWOaM1O7OKEBu93GkXqxreP
	ctvGTUFLt7hNmedORp2+u5AkCtjk1jDMhVYpgayxNx3WlN0sqBmvKykkv/sXb++1ekRLhU
	LeUdwMI7oMXhMVJstQZ3JqKFUueP0UVCVqW8QGcDcr+Prga7ujgdPvCHtLzqXiSNKplZ3K
	l9hq9QrULDN8qYb4tcwcQq0H+dl6SEUK6k07QAxsiVyudfXJbIjCJWR9Xe1Icg==
Date: Mon, 30 Sep 2024 18:22:35 +0200
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Frank Li <Frank.li@nxp.com>
Cc: alexandre.belloni@bootlin.com, arnd@arndb.de, bbrezillon@kernel.org,
 boris.brezillon@collabora.com, conor.culhane@silvaco.com,
 gregkh@linuxfoundation.org, imx@lists.linux.dev,
 linux-i3c@lists.infradead.org, linux-kernel@vger.kernel.org,
 pthombar@cadence.com
Subject: Re: [PATCH v2 1/1] MAINTAINERS: I3C: Add Frank Li as nxp I3C
 controller driver maintainer
Message-ID: <20240930182235.52c4530e@xps-13>
In-Reply-To: <Zt9VDJ546znNR7AT@lizhi-Precision-Tower-5810>
References: <20240815141609.4089406-1-Frank.Li@nxp.com>
	<Zt9VDJ546znNR7AT@lizhi-Precision-Tower-5810>
Organization: Bootlin
X-Mailer: Claws Mail 4.2.0 (GTK 3.24.41; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: miquel.raynal@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240930_092243_658003_18DBC750 
X-CRM114-Status: GOOD (  12.18  )
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

SGkgRnJhbmssCgpGcmFuay5saUBueHAuY29tIHdyb3RlIG9uIE1vbiwgOSBTZXAgMjAyNCAxNjow
NTozMiAtMDQwMDoKCj4gT24gVGh1LCBBdWcgMTUsIDIwMjQgYXQgMTA6MTY6MDlBTSAtMDQwMCwg
RnJhbmsgTGkgd3JvdGU6Cj4gPiBBZGQgRnJhbmsgTGkgYXMgTlhQIGkzYyBjb250cm9sbGVyIGRy
aXZlciBhcyBtYWludGFpbmVyIGFuZCBhZGQgbWFpbCBsaXN0Cj4gPiBpbXhAbGlzdHMubGludXgu
ZGV2IGZvciBpdC4KPiA+Cj4gPiBBZGQgRnJhbmsgTGkgYXMgSTNDIHN1YnN5c3RlbSByZXZpZXdl
ci4KPiA+Cj4gPiBTaWduZWQtb2ZmLWJ5OiBGcmFuayBMaSA8RnJhbmsuTGlAbnhwLmNvbT4KPiA+
IC0tLSAgCj4gCj4gTWlxdWVsOgo+IAlBbnkgY29tbWVudHM/CgpJIGd1ZXNzIHdlJ2xsIGhhcHBp
bHkgdGFrZSB5b3VyIGZlZWRiYWNrIG9uIHBhdGNoZXMgdGFyZ2V0aW5nIHRoZSBTVkMKZHJpdmVy
LCB5b3UndmUgYmVlbiB3b3JraW5nIGEgbG90IG9uIGl0LiBIb3dldmVyLCBpbiBnZW5lcmFsIHRo
ZXJlIGhhcwpiZWVuIGEgbG90IG9mIGRpc2N1c3Npb25zIGhhcHBlbmluZyBvbiB5b3VyIHN1YnN0
YW50aWFsIHBhdGNoc2V0cyBhbmQKbGl0dGxlIHRvIG5vIGNvbnZlcmdlbmNlIGluIHRoZSBlbmQu
IEkgdW5kZXJzdGFuZCB5b3Ugd2FudCB0byBwdXNoIHlvdXIKcGF0Y2hlcyB1cHN0cmVhbSBhbmQg
SSBhbHNvIHdhbnQgdG8gbWFrZSB0aGluZ3MgbW92ZSBmb3J3YXJkLCBidXQgbWF5YmUKb25lIG9m
IHRoZSByZWFzb25zIGZvciB0aGUgc3RhbGxzIGlzIHRoZSBsYWNrIG9mIGZsdWVudCBleGNoYW5n
ZXMKYmV0d2VlbiB1cyBhbmQgdGhlIGRpZmZpY3VsdHkgdG8gZXhwbGFpbiBiaWdnZXIgcGljdHVy
ZXMgaW4gYSBjbGVhcgp3YXkuIEkgYmVsaWV2ZSBtYWludGFpbmluZyBhIHN1YnN5c3RlbSBzdGls
bCByZXF1aXJlcyBhIGJpdCBtb3JlCmV4cGVyaWVuY2Ugb24gdGhpcyByZWdhcmQuCgpUaGFua3Ms
Ck1pcXXDqGwKCi0tIApsaW51eC1pM2MgbWFpbGluZyBsaXN0CmxpbnV4LWkzY0BsaXN0cy5pbmZy
YWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGlu
dXgtaTNjCg==
