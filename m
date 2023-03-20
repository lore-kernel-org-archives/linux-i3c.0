Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F398FC7618A
	for <linux-i3c@archiver.kernel.org>; Mon, 20 Mar 2023 10:51:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=UFfEtSXWxq85aa1ex0BDMJCrUSv4luiKM2bOvZT0Vhc=; b=ozSsQ5MZ1eHa8G
	sZatEJ2/5pftKvimZZdjeVYcBl1qjsu1XhxTAg9IF6vmyi1u2DHAFAhhVbHfeYOdh5wrvhAN+idTj
	hAbzaIuRENgeuVtB9YwDbOdKi/o1eJf9XzotudwgtJj2xjU0jdhGBXVMlQJAectGZKlVhmaDRMFY/
	e6aBge34YnA4nTjmNk7EMrD8wlW+7LEMCsCZB+UHShV87yRbydrLohvUjfAtXRBbrhlHOizXMo2/K
	Us8YTuWF0cMZWl96SVnxcDoLCH1MibRNARp5N9EfFbck7y6+Gdh5/fntbn6FnJB/A13LqIB75ZMON
	xSN78KOeSJNhkiPzaT8Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1peD76-008i5H-13;
	Mon, 20 Mar 2023 10:51:40 +0000
Received: from relay11.mail.gandi.net ([2001:4b98:dc4:8::231])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1peD72-008i3W-0z
	for linux-i3c@lists.infradead.org;
	Mon, 20 Mar 2023 10:51:38 +0000
Received: (Authenticated sender: miquel.raynal@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id 5652110000F;
	Mon, 20 Mar 2023 10:51:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1679309489;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=vsPAX6IwW89kO30w+QcKcPHYstEcFFbFvCdgH9zg8Kc=;
	b=Gm8WKPn/u079bWEr+svkrEjk2GcvXF+FSYBoQekMr7Ht5QNxp/sRZukIJgkExl97BrY97D
	F90kOhQecY7HjNKOo2bXpkVZCBl9ENu+WSeUYu0EBdZ450QtsgYKGCszUZXAo9x10W1GVw
	SIM2Nuna1w2iZKOIqYg5dnfWCWR+yO8SwzKuMvIPc8dDVwJybO24zAJBC7yLERBnEH8gn1
	96RKTiTJJgS+9PTfspT+B7W2M3jeR+oxXIdaS8bk482bCVxlIzdqLVw2iywVRjSE7pBxS6
	WoQjM5buvNkc1zuv3+eqfSmyw37B6W5FRyiW83Wt9AG7GM9FeVgmY6kquySJoA==
Date: Mon, 20 Mar 2023 11:51:26 +0100
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Uwe =?UTF-8?B?S2xlaW5lLUvDtm5pZw==?= <u.kleine-koenig@pengutronix.de>
Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>, =?UTF-8?B?UHJ6ZW15?=
 =?UTF-8?B?c8WCYXc=?= Gaj <pgaj@cadence.com>, Conor Culhane
 <conor.culhane@silvaco.com>, linux-i3c@lists.infradead.org,
 kernel@pengutronix.de
Subject: Re: [PATCH 1/5] i3c: Make i3c_master_unregister() return void
Message-ID: <20230320115126.5470515b@xps-13>
In-Reply-To: <20230318233311.265186-2-u.kleine-koenig@pengutronix.de>
References: <20230318233311.265186-1-u.kleine-koenig@pengutronix.de>
	<20230318233311.265186-2-u.kleine-koenig@pengutronix.de>
Organization: Bootlin
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230320_035136_644002_2C2844A8 
X-CRM114-Status: UNSURE (   5.60  )
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

SGkgVXdlLAoKdS5rbGVpbmUta29lbmlnQHBlbmd1dHJvbml4LmRlIHdyb3RlIG9uIFN1biwgMTkg
TWFyIDIwMjMgMDA6MzM6MDcgKzAxMDA6Cgo+IFRoZSBmdW5jdGlvbiByZXR1cm5lZCB6ZXJvIHVu
Y29uZGl0aW9uYWxseS4gU3dpdGNoIHRoZSByZXR1cm4gdHlwZSB0byB2b2lkCj4gYW5kIHNpbXBs
aWZ5IHRoZSBjYWxsZXJzIGFjY29yZGluZ2x5Lgo+IAo+IFNpZ25lZC1vZmYtYnk6IFV3ZSBLbGVp
bmUtS8O2bmlnIDx1LmtsZWluZS1rb2VuaWdAcGVuZ3V0cm9uaXguZGU+CgpSZXZpZXdlZC1ieTog
TWlxdWVsIFJheW5hbCA8bWlxdWVsLnJheW5hbEBib290bGluLmNvbT4KClRoYW5rcywKTWlxdcOo
bAoKLS0gCmxpbnV4LWkzYyBtYWlsaW5nIGxpc3QKbGludXgtaTNjQGxpc3RzLmluZnJhZGVhZC5v
cmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1pM2MK
