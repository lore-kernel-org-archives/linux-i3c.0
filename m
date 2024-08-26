Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 48050C5321E
	for <linux-i3c@archiver.kernel.org>; Mon, 26 Aug 2024 08:13:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=GzTbVaetuldJLTQzlulGL9ZXzXF0VeBo0VmybyCSnPI=; b=uRo4s187TEZpyb
	Pdvn6o/KFUYkVWcvWX2eQzKt1IYW/g+0GP8Dh/oUrh9YjYXI49dUvs7RyNmJVTReWyFw4QmjlB/ce
	G4358+lBoOChgE3DOgqZwdeMddJjN42YKUcBVbogCk1P4OhLWOr18/f/iOnqxQT0HYcl5S91A5abI
	c5uVJvWKG39BUlvESadNDZPXNQaRImJA6HmHgVNLST4MKpZQlnSkt9GbJ3lAKXAQcDwlaIRMZjLKy
	DiAxXtq0SGChtmk4Ld3Se+1Z0stnOsQUG49TpUFuIWW+qx6Vl71VeRoGGmyxpE8KjO4fy6vJkzQLl
	UVLTTcWiDmeXlBq2KFWQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1siUqz-00000006Qeg-4A56;
	Mon, 26 Aug 2024 08:13:33 +0000
Received: from relay7-d.mail.gandi.net ([217.70.183.200])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1siUqw-00000006Qck-0vra
	for linux-i3c@lists.infradead.org;
	Mon, 26 Aug 2024 08:13:32 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 3D35D20007;
	Mon, 26 Aug 2024 08:13:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1724660007;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Qp/00LpdFt9fyZ9y8QshjY+ptg9wzwMtAYA98L2na+o=;
	b=LrSIsxdlmUt5Cou9Feh8QCcpu4xZ0fj6zVtQ2So7NSmWHulQyMiQPZs67HToG1ptjSlVRf
	HGZPAGVF2OZOOdGJ6BXW6X8oOScS/y38En16izvGbzQMHpVdeO9CDkdYMq3x7waYSg0F0t
	nFwf48cMzmjz1EdvjMOJnE3at65uHFXltVc329sYuKBtUng1mhGkgJ3l/Le/i4YnJMmjIf
	vn4rIxT8rGOjWv6o4MtnRaaxG4QtA08OMHSTrlq4MPpTBiOH9tzKZc1qZxK8WP1RSYHOrz
	D8x0HP9JxckoBRAu53ANliqxTAUFC8Tumti1BDG4AdLT+qN9LCn02dnuXUCF2g==
Date: Mon, 26 Aug 2024 10:13:23 +0200
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: carlos.song@nxp.com
Cc: alexandre.belloni@bootlin.com, linux-i3c@lists.infradead.org,
 linux-kernel@vger.kernel.org, imx@lists.linux.dev, linux-imx@nxp.com
Subject: Re: [PATCH v3] i3c: master: support to adjust first broadcast
 address speed
Message-ID: <20240826101323.746b617c@xps-13>
In-Reply-To: <20240826050957.1881563-1-carlos.song@nxp.com>
References: <20240826050957.1881563-1-carlos.song@nxp.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.2.0 (GTK 3.24.41; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: miquel.raynal@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240826_011330_417519_703CFC03 
X-CRM114-Status: UNSURE (   5.87  )
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

SGkgQ2FybG9zLAoKY2FybG9zLnNvbmdAbnhwLmNvbSB3cm90ZSBvbiBNb24sIDI2IEF1ZyAyMDI0
IDEzOjA5OjU3ICswODAwOgoKPiBGcm9tOiBDYXJsb3MgU29uZyA8Y2FybG9zLnNvbmdAbnhwLmNv
bT4KPiAKPiBBY2NvcmRpbmcgdG8gSTNDIHNwZWMgNi4yIFRpbWluZyBTcGVjaWZpY2F0aW9uLCB0
aGUgT3BlbiBEcmFpbiBIaWdoIFBlcmlvZAo+IG9mIFNDTCBDbG9jayB0aW1pbmcgZm9yIGZpcnN0
IGJyb2FkY2FzdCBhZGRyZXNzIHNob3VsZCBiZSBhZGp1c3RlZCB0byAyMDBucwo+IGF0IGxlYXN0
LiBJM0MgZGV2aWNlIHdvcmtpbmcgYXMgaTJjIGRldmljZSB3aWxsIHNlZSB0aGUgYnJvYWRjYXN0
IHRvIGNsb3NlCj4gaXRzIFNwaWtlIEZpbHRlciB0aGVuIGNoYW5nZSB0byB3b3JrIGF0IEkzQyBt
b2RlLiBBZnRlciB0aGF0IEkzQyBvcGVuIGRyYWluCj4gU0NMIGhpZ2ggbGV2ZWwgc2hvdWxkIGJl
IGFkanVzdGVkIGJhY2suCj4gCj4gU2lnbmVkLW9mZi1ieTogQ2FybG9zIFNvbmcgPGNhcmxvcy5z
b25nQG54cC5jb20+Cj4gUmV2aWV3ZWQtYnk6IEZyYW5rIExpIDxGcmFuay5MaUBueHAuY29tPgoK
UmV2aWV3ZWQtYnk6IE1pcXVlbCBSYXluYWwgPG1pcXVlbC5yYXluYWxAYm9vdGxpbi5jb20+CgpG
cmFuaywgZGlkIHlvdSB0ZXN0IGl0IHdpdGggZWcuIHRoZSBTaWx2YWNvIG1hc3Rlcj8KClRoYW5r
cywKTWlxdcOobAoKLS0gCmxpbnV4LWkzYyBtYWlsaW5nIGxpc3QKbGludXgtaTNjQGxpc3RzLmlu
ZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9s
aW51eC1pM2MK
