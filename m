Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5A0B2C10F1A
	for <linux-i3c@archiver.kernel.org>; Tue,  7 May 2024 08:03:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=l0V5YchiKAsy1oWApmnr3IRwq1go9QWkOdA8+wSvPMU=; b=3HdqzIPNLXhmxL
	NYJN//M7DPKLbXILOekvdBbAGwdyObxJqD4yAsZkEfce9L3j+gdBelM1B00cmKmctGd9QLqJQr1E0
	f+9Fnd2UKlm+heD13Fdifq86JH5L64u3EnH1YGuWKqigWFR7wAXpUWLAr8czozxBI91S/9T3KG5/K
	OAyY69O/MbwScik6Vm9xD1GWMc9Cr1c7PB2jMXwGCpk8YMj8Q3o29F00Lkb7Eh+vBITsaXn4XJ3EO
	V6uKYSfGJMzrOa1huoQjjxMWYiym3omIfJ6wU+CcAz6iWA09AApi30icsg1v5SrmqIxs1X8n9Ho3X
	ZPJT2o/deqP6HArbpS0w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s4Fng-0000000A4Of-4AhN;
	Tue, 07 May 2024 08:03:48 +0000
Received: from relay9-d.mail.gandi.net ([2001:4b98:dc4:8::229])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s4Fnc-0000000A4L8-3J8D
	for linux-i3c@lists.infradead.org;
	Tue, 07 May 2024 08:03:47 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 77983FF811;
	Tue,  7 May 2024 08:03:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1715069021;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=3stVzcSl81pEJNONxNBwP2g/IfGB0kfIKSg1nsdNyhA=;
	b=LXUiuorgxAxO5DbieuICsybsdUR95Ht6Gu8+Tx2dG5iJjSPYpqsTCk2IxU5sBridjlOADl
	lCCWm9yo8a+q+MrSiqnUc6RPBkO8AFTqObAc9npdia6HpNvlNi1ETOK1WwnnWuXtyOyfzf
	u/7xb80U6YxZa8/M0HDwBtyK0DKBrkHAORY+l6GgaKB+V6aQE9wkV+VV4NmuCBCsPMODHH
	nbg6+SBiLw9rYZMGZ3A+un9LO2BuGk5Ovt4kxRsZEU7PH7GkKgxd5AqDfw9epOvABnFx3N
	tH00XS/S94VG/PSyhxKHOQgJmLvCRffhWWstdiutPT6Z6M9/9tWGMIUcK92wsg==
Date: Tue, 7 May 2024 10:03:40 +0200
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Frank Li <Frank.Li@nxp.com>
Cc: alexandre.belloni@bootlin.com, conor.culhane@silvaco.com,
 imx@lists.linux.dev, linux-i3c@lists.infradead.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 2/3] i3c: master: svc: change ENXIO to EAGAIN when
 IBI occurs during start frame
Message-ID: <20240507100340.674f9acc@xps-13>
In-Reply-To: <20240506164009.21375-2-Frank.Li@nxp.com>
References: <20240506164009.21375-1-Frank.Li@nxp.com>
	<20240506164009.21375-2-Frank.Li@nxp.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: miquel.raynal@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240507_010345_073768_5C8A0085 
X-CRM114-Status: UNSURE (   6.18  )
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

SGkgRnJhbmssCgpGcmFuay5MaUBueHAuY29tIHdyb3RlIG9uIE1vbiwgIDYgTWF5IDIwMjQgMTI6
NDA6MDggLTA0MDA6Cgo+IHN2Y19pM2NfbWFzdGVyX3hmZXIoKSByZXR1cm5zIGVycm9yIEVOWElP
IGlmIGFuIEluLUJhbmQgSW50ZXJydXB0IChJQkkpCj4gb2NjdXJzIHdoZW4gdGhlIGhvc3Qgc3Rh
cnRzIHRoZSBmcmFtZS4KPiAKPiBDaGFuZ2UgZXJyb3IgY29kZSB0byBFQUdBSU4gdG8gaW5mb3Jt
IHRoZSBjbGllbnQgZHJpdmVyIHRoYXQgdGhpcwo+IHNpdHVhdGlvbiBoYXMgb2NjdXJyZWQgYW5k
IHRvIHRyeSBhZ2FpbiBzb21ldGltZSBsYXRlci4KPiAKPiBGaXhlczogNWU1ZTNjOTJlNzQ4ICgi
aTNjOiBtYXN0ZXI6IHN2YzogZml4IHdyb25nIGRhdGEgcmV0dXJuIHdoZW4gSUJJIGhhcHBlbiBk
dXJpbmcgc3RhcnQgZnJhbWUiKQo+IFNpZ25lZC1vZmYtYnk6IEZyYW5rIExpIDxGcmFuay5MaUBu
eHAuY29tPgoKUmV2aWV3ZWQtYnk6IE1pcXVlbCBSYXluYWwgPG1pcXVlbC5yYXluYWxAYm9vdGxp
bi5jb20+CgoKVGhhbmtzLApNaXF1w6hsCgotLSAKbGludXgtaTNjIG1haWxpbmcgbGlzdApsaW51
eC1pM2NAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWls
bWFuL2xpc3RpbmZvL2xpbnV4LWkzYwo=
