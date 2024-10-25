Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5FFA9D0C615
	for <linux-i3c@archiver.kernel.org>; Fri, 25 Oct 2024 14:15:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=c42HxkRFJLaxYPqrHQigA1ncrdDwGpgVhqCUpBhUrsc=; b=kek/uQSFIUbrIx
	Z+ajLwe1mDbPPQZwOOpxVNThfN5lWV6S3p/PPO83twFTODZ6gi3p+LBwFhnmmgZt+6CJZz+igoPqh
	mNDgGQeCE/LoZqdcMLuG9wRJkt5lQ6psLbEqwCaNOybKTgxzRB1EgOIBcQB1Rz6e90iaQQnMP5l7f
	HP1F33lkFVp+x0iQcNtenhhRHudqIyxe/wIzdSx4PI41OHEDWD82lwSkJSr4ZvjKPzOgwJiTX2jSJ
	Jdj6nLAVlnrmp1rloUxLg/m+C9KZLi4HZWTCJz1BVPVh39lm8g8KjMzWLObJ6obzFMjfgBCfiNAb2
	Aj+jRJwLYmGmA+akFH2Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t4L5j-00000003xsp-0DdQ;
	Fri, 25 Oct 2024 14:15:03 +0000
Received: from relay1-d.mail.gandi.net ([217.70.183.193])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t4L1G-00000003wjv-0gT0
	for linux-i3c@lists.infradead.org;
	Fri, 25 Oct 2024 14:10:27 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 9B29924000A;
	Fri, 25 Oct 2024 14:10:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1729865423;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=UNZphZRiAU7HwBE54GXF6AQmf4CgwHYIZ6gfOVxLRws=;
	b=VHLjaCFAEFG+cxatoXyaUlHYx/dlKo12fKFbWCMcrp4s8PokLQddoLf19eKvZcG1GfpjDD
	JHkqYksUil83JkRe6MVgJTa35SRjUPk9c463407JhjNbfY8dMhjHujIRT7AdOYWCVZWEJV
	uKpdRvFtqNHjsiSdZSmYKaN2Xc61fKdDHD8CmqTDENoszI2ZHTe4iXkVw4KlCU9prPeUyS
	nsWZ3OHPNfHApIv6cbgsD72uwNOxfCWyf0x/MWEHpXa1v/pVLXH/wq3hbVx69ILhanfEHU
	DPK4I3q/pTlNEFjo4PzYG2eMP7biMBhtTDW8OG/U4VqIs6DX7Sfkze3ORNB2RQ==
Date: Fri, 25 Oct 2024 16:10:20 +0200
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Frank Li <Frank.li@nxp.com>
Cc: Conor Culhane <conor.culhane@silvaco.com>, Alexandre Belloni
 <alexandre.belloni@bootlin.com>, Clark Wang <xiaoning.wang@nxp.com>,
 "moderated list:SILVACO I3C DUAL-ROLE MASTER"
 <linux-i3c@lists.infradead.org>, open list <linux-kernel@vger.kernel.org>,
 imx@lists.linux.dev
Subject: Re: [PATCH 1/1] i3c: master: svc: Modify enabled_events bit 7:0 to
 act as IBI enable counter
Message-ID: <20241025161020.11765f79@xps-13>
In-Reply-To: <ZxukksXwyWN2HQ3I@lizhi-Precision-Tower-5810>
References: <20241024203855.1584416-1-Frank.Li@nxp.com>
	<20241025095318.4785df2c@xps-13>
	<ZxukksXwyWN2HQ3I@lizhi-Precision-Tower-5810>
Organization: Bootlin
X-Mailer: Claws Mail 4.2.0 (GTK 3.24.41; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: miquel.raynal@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241025_071026_361454_3500C100 
X-CRM114-Status: GOOD (  10.42  )
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

SGkgRnJhbmssCgpGcmFuay5saUBueHAuY29tIHdyb3RlIG9uIEZyaSwgMjUgT2N0IDIwMjQgMTA6
MDA6NTAgLTA0MDA6Cgo+IE9uIEZyaSwgT2N0IDI1LCAyMDI0IGF0IDA5OjUzOjE4QU0gKzAyMDAs
IE1pcXVlbCBSYXluYWwgd3JvdGU6Cj4gPiBIaSBGcmFuaywKPiA+Cj4gPiBGcmFuay5MaUBueHAu
Y29tIHdyb3RlIG9uIFRodSwgMjQgT2N0IDIwMjQgMTY6Mzg6NTUgLTA0MDA6Cj4gPiAgCj4gPiA+
IEZpeCBpc3N1ZSB3aGVyZSBkaXNhYmxpbmcgSUJJIG9uIG9uZSBkZXZpY2UgZGlzYWJsZXMgdGhl
IGVudGlyZSBJQkkKPiA+ID4gaW50ZXJydXB0LiBNb2RpZnkgYml0IDc6MCBvZiBlbmFibGVkX2V2
ZW50cyB0byBzZXJ2ZSBhcyBhbiBJQkkgZW5hYmxlICAKPiA+Cj4gPiBJcyB0aGlzIGJpdGZpZWxk
IGFyYml0cmFyeT8KPiA+Cj4gPiBJcyB0aGVyZSBhIHJhdGlvbmFsZSBiZWhpbmQgaXQ/ICAKPiAK
PiBNYXggZGV2aWNlcyBudW1iZXIgdW5kZXIgYSBJM0MgYnVzIGlzIDEyOCBiZWNhdXNlIGR5bmFt
aWMgYWRkcmVzcyBpcyA3IGJpdC4KPiBTbyA4IGJpdHMgZm9yIGl0IHNob3VsZCBiZSBlbm91Z2gu
Cj4gCj4gQml0MzEgYXMgaG90am9pbiwgQml0MzAgcmVzZXJ2ZWQgYXMgY29udHJvbCBzd2l0Y2gg
cmVxdWVzdC4KCk1ha2VzIHNlbnNlLgoKVGhhbmtzLApNaXF1w6hsCgotLSAKbGludXgtaTNjIG1h
aWxpbmcgbGlzdApsaW51eC1pM2NAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5m
cmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LWkzYwo=
