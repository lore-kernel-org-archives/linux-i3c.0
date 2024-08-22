Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C5845C3DA4A
	for <linux-i3c@archiver.kernel.org>; Thu, 22 Aug 2024 07:46:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=cd/l+UEk0Xlz9gQYbiFG0IJ4dtSTNOcbSIzsr6Uabzk=; b=03gfJbvdAn/OKX
	uqC3X9YDfXftdskRinR/xI8mqtn2vD1Y4m0ZgF/NG79BAGtE8MZ8O+RKJYev+O9iSzUxVWewi0QoQ
	Spp0qTfypmwluropfQ2Y5P0UOccoOkzs3oxCztivOyVWS0YiqoAM7HqdUBAp+sOXBmCapSVjnYp6U
	jR4EkTN8PIgOahboYG2+3LiHo5HF3sq9ih9Yzpk5OVfjmw2ItGFR1MChIX0gBQnH15zIKCsCJIS9X
	q0aufxwuoAe+PGXO0jhoXoA/Bv2DCiO3YDxVvKfqhQUcOcx8Sa085wB4JAwfXG3I9GwAi1mZbgFWw
	lw92hxI5eyXxMox4zUZg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sh2X3-0000000BvZC-1HRU;
	Thu, 22 Aug 2024 07:46:57 +0000
Received: from relay7-d.mail.gandi.net ([217.70.183.200])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sh2WW-0000000BvRw-1TmO
	for linux-i3c@lists.infradead.org;
	Thu, 22 Aug 2024 07:46:26 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id DC12420008;
	Thu, 22 Aug 2024 07:46:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1724312781;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=OppYEcUmoLJEMht1bqkFMeGjddAvbTCwXLdsBIw5K6c=;
	b=aoRjYNIz04a8qgzn4QZQC/PlPmlK5q5YnIHvPW5/fg6hgt9BDMfyANCTjDv5eT0d+wc3OD
	4eVy/GObaMdKEXk4wSV0gpdNRscpPMwQRwq/REtN4CD00djpFtmpTo27oUD+oOQ0YjJCpS
	ubFxdv7xwKbOcKiOrgx6LxkvS/NZBBJYIzrUpbHzoKdOvZ/2+mx6PySvaRME+1k+Jde5bB
	d9EOrN1iCFFJ3sZAa/Mxj2QgcxRM9X/I5oYkpTWrPG2n6E/Gy0gp46V0xaaZQnVH1DSzGV
	SXqfi/iyOTqFjswQmxtY1PXGAerCOhSld6tpxQulNORslGjg9eKc3YDGI8MeVQ==
Date: Thu, 22 Aug 2024 09:46:19 +0200
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Carlos Song <carlos.song@nxp.com>
Cc: "alexandre.belloni@bootlin.com" <alexandre.belloni@bootlin.com>, Frank
 Li <frank.li@nxp.com>, "conor.culhane@silvaco.com"
 <conor.culhane@silvaco.com>, "linux-i3c@lists.infradead.org"
 <linux-i3c@lists.infradead.org>, "linux-kernel@vger.kernel.org"
 <linux-kernel@vger.kernel.org>, "imx@lists.linux.dev"
 <imx@lists.linux.dev>, dl-linux-imx <linux-imx@nxp.com>
Subject: Re: [EXT] Re: [PATCH v2 1/2] i3c: master: support to adjust first
 broadcast address speed
Message-ID: <20240822094619.08f1a374@xps-13>
In-Reply-To: <VI1PR04MB500513D0A8E03D49EA2558ECE88F2@VI1PR04MB5005.eurprd04.prod.outlook.com>
References: <20240807061306.3143528-1-carlos.song@nxp.com>
	<20240821180709.1626dd64@xps-13>
	<VI1PR04MB500513D0A8E03D49EA2558ECE88F2@VI1PR04MB5005.eurprd04.prod.outlook.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.2.0 (GTK 3.24.41; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: miquel.raynal@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240822_004625_171929_9A5A7DFF 
X-CRM114-Status: UNSURE (   9.17  )
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

SGkgQ2FybG9zLAoKPiA+IEknbSBzb3JyeSwgY2FuIHlvdSByZXBocmFzZSAiY29uZmlndXJlZCBh
Y2NvcmRpbmcgdG8gSTNDIGJ1cyBtb2RlIiA/Cj4gPiAgIAo+IAo+IEhpISBUaGFuayB5b3UgZm9y
IHlvdXIgYWNrISBJIHdpbGwgY2hhbmdlIGFib3ZlIHRvOgo+IAo+IC8qKgo+ICAqIGVudW0gaTNj
X29wZW5fZHJhaW5fc3BlZWQgLSBJM0Mgb3Blbi1kcmFpbiBzcGVlZAo+ICAqIEBJM0NfT1BFTl9E
UkFJTl9TTE9XX1NQRUVEOiBTbG93IG9wZW4tZHJhaW4gc3BlZWQgZm9yIHNlbmRpbmcgdGhlIGZp
cnN0Cj4gICoJCQkJYnJvYWRjYXN0IGFkZHJlc3MuIFRoZSBmaXJzdCBicm9hZGNhc3QgYWRkcmVz
cyBhdCB0aGlzIHNwZWVkCj4gICoJCQkJd2lsbCBiZSB2aXNpYmxlIHRvIGFsbCBkZXZpY2VzIG9u
IHRoZSBJM0MgYnVzLiBJM0MgZGV2aWNlcwo+ICAqCQkJCXdvcmtpbmcgaW4gSTJDIG1vZGUgd2ls
bCB0dXJuIG9mZiB0aGVpciBzcGlrZSBmaWx0ZXIgd2hlbgkJICAKPiAgKgkJCQlzd2l0Y2hpbmcg
aW50byBJM0MgbW9kZS4KPiAgKiBASTNDX09QRU5fRFJBSU5fTk9STUFMX1NQRUVEOiBOb3JtYWwg
b3Blbi1kcmFpbiBzcGVlZCBpbiBJM0MgYnVzIG1vZGUuCj4gICovCj4gCj4gSXMgdGhpcyBhY2Nl
cHRhYmxlPwoKU291bmRzIG11Y2ggY2xlYXJlciB0byBtZSwgdGhhbmtzIQoKTWlxdcOobAoKLS0g
CmxpbnV4LWkzYyBtYWlsaW5nIGxpc3QKbGludXgtaTNjQGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0
cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1pM2MK
