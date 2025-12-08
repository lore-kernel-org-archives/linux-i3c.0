Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8EC37D3B7E2
	for <linux-i3c@archiver.kernel.org>; Mon,  8 Dec 2025 21:14:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=FaZ1ZDfMi51c06HSPkuwt3N+OPP4OnzQz+m4EHW40K0=; b=W7dmX2Ze64zFmh
	1mYFJwQbkBiYgb7H9eserxhtP6rWxX7jK2C3zmGrdgDRlhtavXdUL5X5xnBsI08ZpQMadQomU2I5g
	Gc+eUIc4JnSEs/mPtuLLdihONV3EtI+kl8pzQKlepsrVlXtPdk8LlK8wzW5PUI8ugAfEEjuoIKB28
	tG5DkgbiBvlmIKWFLbiAkbB+YCoPoiQnsG1wi3iYjNEzl514i5+CDhbhf35fqZPDmR05jiH2evqzm
	cBEu8YpeWEClxHQYm6+kRIgejIcWaPBE/YxpvWMjpyFJ1diyDaTxZOE7lNR5mvPXOJnO3NHl3+L5T
	wtUOJhDy3+DFwi25N5GA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vSiZ0-0000000DXtL-0PwQ;
	Mon, 08 Dec 2025 21:14:34 +0000
Received: from smtpout-04.galae.net ([185.171.202.116])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vSiYw-0000000DXsv-3c0F
	for linux-i3c@lists.infradead.org;
	Mon, 08 Dec 2025 21:14:32 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id ED4DAC180D1;
	Mon,  8 Dec 2025 21:14:03 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 8FD33606DD;
	Mon,  8 Dec 2025 21:14:27 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 31827103C8D5C;
	Mon,  8 Dec 2025 22:14:25 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1765228467; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 in-reply-to:references; bh=UMFT6VG7jWFLIe582DxUJnepXZaYsQcmdz9buJiE4Vs=;
	b=IUIdMY/3vkIQDsrkI/x0ClMZe0zc/bKSo5mxJGwUq8mkJ6yK8Z1yAiijJfRcP30Difs2Re
	EQTigSJS7SVg33H+TwvOsuZq1dEvYrHg5T2ataP+kUrGTWp2h6wv5Pbb30XrjO4KkGWNUf
	OtKGPuyuyDUik3jFS1rxXZwb3ymdYvF5D1OkaYf8b2dzuPLOZlXgpQxzTIHUXNsotIzLWY
	Vk1OKII2GQo8P1Ylsix3hBiJP1X3roc4Sxn9soHixNqA7V6vIIxqRyluAITyaGBGnFJxQ7
	ya3r40riWC1oE/RF0d8DuI2939Y0PyLG6xwJ08k4gkq4m1xWDUlweT3tLw51wQ==
Date: Mon, 8 Dec 2025 22:14:24 +0100
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: Frank Li <Frank.li@nxp.com>
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
	Jorge Marques <jorge.marques@analog.com>,
	linux-i3c@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/2] i3c: master: Fix confusing cleanup.h syntax
Message-ID: <20251208211424c71a5829@mail.local>
References: <20251208020750.4727-3-krzysztof.kozlowski@oss.qualcomm.com>
 <aTbz2gkfQm9jcHbQ@lizhi-Precision-Tower-5810>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <aTbz2gkfQm9jcHbQ@lizhi-Precision-Tower-5810>
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251208_131431_080819_EFCF4DD4 
X-CRM114-Status: GOOD (  27.30  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-i3c" <linux-i3c-bounces@lists.infradead.org>
Errors-To: linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org

Hello Frank,

On 08/12/2025 10:50:50-0500, Frank Li wrote:
> On Mon, Dec 08, 2025 at 03:07:51AM +0100, Krzysztof Kozlowski wrote:
> > Initializing automatic __free variables to NULL without need (e.g.
> > branches with different allocations), followed by actual allocation is
> > in contrary to explicit coding rules guiding cleanup.h:
> >
> > "Given that the "__free(...) = NULL" pattern for variables defined at
> > the top of the function poses this potential interdependency problem the
> > recommendation is to always define and assign variables in one statement
> > and not group variable definitions at the top of the function when
> > __free() is used."
> >
> > Code does not have a bug, but is less readable and uses discouraged
> > coding practice, so fix that by moving declaration to the place of
> > assignment.
> >
> > Not that other existing usage of __free() in this context is a corret
> > exception initialized to NULL, because the actual allocation is branched
> > in if().
> >
> > Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
> > ---
> >  drivers/i3c/master.c | 3 +--
> >  1 file changed, 1 insertion(+), 2 deletions(-)
> >
> > diff --git a/drivers/i3c/master.c b/drivers/i3c/master.c
> > index 823661a81f5e..62437a899cdc 100644
> > --- a/drivers/i3c/master.c
> > +++ b/drivers/i3c/master.c
> > @@ -1742,11 +1742,10 @@ EXPORT_SYMBOL_GPL(i3c_master_do_daa);
> >  struct i3c_dma *i3c_master_dma_map_single(struct device *dev, void *buf,
> >  	size_t len, bool force_bounce, enum dma_data_direction dir)
> >  {
> > -	struct i3c_dma *dma_xfer __free(kfree) = NULL;
> >  	void *bounce __free(kfree) = NULL;
> >  	void *dma_buf = buf;
> >
> > -	dma_xfer = kzalloc(sizeof(*dma_xfer), GFP_KERNEL);
> > +	struct i3c_dma *dma_xfer __free(kfree) = kzalloc(sizeof(*dma_xfer), GFP_KERNEL);
> >  	if (!dma_xfer)
> >  		return NULL;
> 
> According to thread
> https://lore.kernel.org/all/CAHk-=whPZoi03ZwphxiW6cuWPtC3nyKYS8_BThgztCdgPWP1WA@mail.gmail.com/
> "But again: I don't want to make this some kind of hard rule, and I
> think it should be done judiciously and with taste, not some kind of
> crazy conversion thing."
> 
> And there are not logic code between declear and kzalloc.
> https://lore.kernel.org/all/CAHk-=wjMMSAaqTjBSfYenfuzE1bMjLj+2DLtLWJuGt07UGCH_Q@mail.gmail.com/
> 	struct ring_buffer_per_cpu *cpu_buffer __free(kfree);
> 
>         cpu_buffer = kzalloc_node(...);
> 
> as separate things (but probably next to each other, so that the
> "__free(kfree)" part makes sense because the allocation is right
> there)."
> 
> void *bounce __free(kfree) = NULL, still be there. Only cleanup one is
> not enough valuable.
> 
> https://lore.kernel.org/all/CAHk-=wjMMSAaqTjBSfYenfuzE1bMjLj+2DLtLWJuGt07UGCH_Q@mail.gmail.com/#t
> "   would then make that otherwise nasty allocation then become just
> 
>     auto cpu_buffer __free(kfree) = cpu_buffer_alloc();
> "
> 
> Maybe we can defer this cleanup after kernel using "auto" keywords widely.

While you are absolutely correct, I'll apply those just because else
we'll get many people submitting the same patch and it indeed makes the
code nicer.

-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
