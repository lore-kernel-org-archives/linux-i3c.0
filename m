Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DE04FC4167B
	for <linux-i3c@archiver.kernel.org>; Fri,  1 Dec 2023 11:59:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=9hyLCptkdHt6WiXSz+UYoRNeZWSNvESUEayKx9eKaNQ=; b=I0FyF4ovzlYSoI
	j+CDvAn6eeoY7Kes7S8Ra2PGJFcL7ikXR6TJKesS8qVt5D+6MOrLBrhCdrWsse8gfNAbjiXqPsRsq
	W3c3X1Fcl2QCwNwB27rCOyrQbywN53ZS/g65f6HWj4QcpisL8+reFTsrYrXf2NhLDO6Y62knqOU3i
	+GzqWNQQg1qHzGZjKJ3opqWD9sw1KKgo7OhA11k44rrhxXwzfCkAjPuxSvBU+zxC59IntvGTLOWVN
	bVnZPUNqEBI9M20o5f/IF3l1lvUxITZbKTUlI8EMMKUPBdnvhmNQDYYGOtwlyMeqYXtl23wvRCLAa
	mTt3nChMJYYMPl7I9djg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r92Av-00DVJl-0j;
	Fri, 01 Dec 2023 11:59:17 +0000
Received: from relay4-d.mail.gandi.net ([217.70.183.196])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r92Ar-00DVIr-2E
	for linux-i3c@lists.infradead.org;
	Fri, 01 Dec 2023 11:59:15 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id D652FE000A;
	Fri,  1 Dec 2023 11:59:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1701431948;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=qo1HW2RbWjsXr4I+NcN2RIgPr28kFzpwIsFkOjIb1/c=;
	b=aknrodqpRG28RyGgGka+xHoWLNUVL0+VgCHlH3dl8FAyFZ4vciFVq5dxSMV8DE6pj6Yg4N
	67gm8OISrrdTcXYKjI3Mvo9GQo+dIu89iK6JJwA7HFtKmS0uhGQ/35nkgJBfREPcFQHUGE
	NbX+2R73R2fuUYLP2zkoFL4VeJcy7z8c7eD8Evik1rI+C3KPcOjIycS9qkEAkeC4i20W2T
	AkL+F14wiuquY3YC660bGdvSCx3HtkT0uwAt8cZA8unonCahx4l7nWPqSK0m8/fwj+snm3
	8RVzvODTGH4NSO1P7g0IfPWwV6yo2PWQ6UbrcbOGsKxmE3QI5GCUxBSlcaXxkQ==
Date: Fri, 1 Dec 2023 12:59:04 +0100
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Frank Li <Frank.Li@nxp.com>
Cc: alexandre.belloni@bootlin.com, conor.culhane@silvaco.com,
 imx@lists.linux.dev, joe@perches.com, linux-i3c@lists.infradead.org,
 linux-kernel@vger.kernel.org, zbigniew.lukwinski@linux.intel.com,
 gregkh@linuxfoundation.org, jirislaby@kernel.org,
 linux-serial@vger.kernel.org
Subject: Re: [PATCH v5 7/7] tty: i3c: add TTY over I3C master support
Message-ID: <20231201125904.6c8128b1@xps-13>
In-Reply-To: <20231130224408.3591288-8-Frank.Li@nxp.com>
References: <20231130224408.3591288-1-Frank.Li@nxp.com>
	<20231130224408.3591288-8-Frank.Li@nxp.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: miquel.raynal@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231201_035913_883176_92947276 
X-CRM114-Status: GOOD (  10.76  )
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

SGkgRnJhbmssCgpGcmFuay5MaUBueHAuY29tIHdyb3RlIG9uIFRodSwgMzAgTm92IDIwMjMgMTc6
NDQ6MDggLTA1MDA6Cgo+IEluIHR5cGljYWwgZW1iZWRkZWQgTGludXggc3lzdGVtcywgVUFSVCBj
b25zb2xlcyByZXF1aXJlIGF0IGxlYXN0IHR3byBwaW5zLAo+IFRYIGFuZCBSWC4gSW4gc2NlbmFy
aW9zIHdoZXJlIEkyQy9JM0MgZGV2aWNlcyBsaWtlIHNlbnNvcnMgb3IgUE1JQ3MgYXJlCj4gcHJl
c2VudCwgd2UgY2FuIHNhdmUgdGhlc2UgdHdvIHBpbnMgYnkgdXNpbmcgdGhpcyBkcml2ZXIuIFBp
bnMgaXMgY3J1Y2lhbAo+IHJlc291cmNlcywgZXNwZWNpYWxseSBpbiBzbWFsbCBjaGlwIHBhY2th
Z2VzLgo+IAo+IFRoaXMgaW50cm9kdWNlcyBzdXBwb3J0IGZvciB1c2luZyB0aGUgSTNDIGJ1cyB0
byB0cmFuc2ZlciBjb25zb2xlIHR0eSBkYXRhLAo+IGVmZmVjdGl2ZWx5IHJlcGxhY2luZyB0aGUg
bmVlZCBmb3IgZGVkaWNhdGVkIFVBUlQgcGlucy4gVGhpcyBub3Qgb25seQo+IGNvbnNlcnZlcyB2
YWx1YWJsZSBwaW4gcmVzb3VyY2VzIGJ1dCBhbHNvIGZhY2lsaXRhdGVzIHRlc3Rpbmcgb2YgSTND
J3MKPiBhZHZhbmNlZCBmZWF0dXJlcywgaW5jbHVkaW5nIGVhcmx5IHRlcm1pbmF0aW9uLCBpbi1i
YW5kIGludGVycnVwdCAoSUJJKQo+IHN1cHBvcnQsIGFuZCB0aGUgY3JlYXRpb24gb2YgbW9yZSBj
b21wbGV4IGRhdGEgcGF0dGVybnMuIEFkZGl0aW9uYWxseSwKPiBpdCBhaWRzIGluIGlkZW50aWZ5
aW5nIGFuZCBhZGRyZXNzaW5nIGlzc3VlcyB3aXRoaW4gdGhlIEkzQyBjb250cm9sbGVyCj4gZHJp
dmVyLgo+IAo+IFNpZ25lZC1vZmYtYnk6IEZyYW5rIExpIDxGcmFuay5MaUBueHAuY29tPgo+IC0t
LQo+IAo+IE5vdGVzOgo+ICAgICBDaGFuZ2UgZnJvbSB2NCB0byB2NQo+ICAgICAtIHNlbmQgaW4g
aTNjIGltcHJvdmVtZW10biBwYXRjaGVzLgoKVGhpcyBpcyBub3Qgd2hhdCBJIHNhaWQsIEkgYmVs
aWV2ZSB0aGlzIHBhdGNoIGFuZCB0aGUgcHJldmlvdXMgcGF0Y2gKc2hvdWxkIGJlIHNlbnQgc2Vw
YXJhdGVseS4KClRoYW5rcywKTWlxdcOobAoKLS0gCmxpbnV4LWkzYyBtYWlsaW5nIGxpc3QKbGlu
dXgtaTNjQGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFp
bG1hbi9saXN0aW5mby9saW51eC1pM2MK
