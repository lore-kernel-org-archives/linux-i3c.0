Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DE6F9C63705
	for <linux-i3c@archiver.kernel.org>; Fri, 25 Nov 2022 21:21:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=zJ0vK+gEDvpVro4fr1nmT3LpMnEjrO7OBMdbZc4jlPo=; b=AnQhF/6Xqgg7dS
	p/AVc5ISLuhFg7WD82PUINNWL7NAxgycgRsD+qSHjGPhvDpWPboAg/Sfru74ZqKaQ0kV6PzFylVyh
	jvORv7ANq0nkoDJDt5vAKPotVBZQkIWrci01zCB/gLfLAD4j6l2G7gBG+D0q/Uxr0gCFJaVA4eEXp
	SoKZp9NngfYAlZPK4AoR/K7AIa41E292+1FDaIX8LSQROdtwc8OcWilLy5Q5ZSS9Xrwx2L61ZFJ6s
	S0h/WCYvdLaLAbPGPBDdVLOG9/Hqj7JIHGvfPfyihfpKsQiTM8MqwA3EYZLWQY97W0Vc/a4QKT5M1
	EgUO5WSlhnHZsIYOaUYw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oyg8J-002E5e-8U; Fri, 25 Nov 2022 21:21:15 +0000
Received: from mail-qv1-xf31.google.com ([2607:f8b0:4864:20::f31])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oxtyL-001Lfw-Af
	for linux-i3c@lists.infradead.org; Wed, 23 Nov 2022 17:55:46 +0000
Received: by mail-qv1-xf31.google.com with SMTP id d18so9116408qvs.6
        for <linux-i3c@lists.infradead.org>; Wed, 23 Nov 2022 09:55:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=mZGGAbQVRBkDZyExP7ffjlyLb6N0sV9F4cgg4l8gSxE=;
        b=My/je7B5AkyQl5fsdxgrcU4MlCIO0r7BQ5Ticu0quoimRFyd1QFWg1CIRYo2hSlhCk
         gVjIJJSUMGBCSbu4UDXzbQPaiJloUApBWvaqFNa76nYHQxGNxzJWcDLEm0qltzXuuN/Z
         gO+uDnAR3m7NYXWzCuDuYM8LFnvN0Xu6vLCMlAClrlBYpN6lXcqxJLcrsGyjBmH/Sv12
         +4Tfy+Id6dykaHW4e8It4+0URa6BTBpgvGETfgKsz3tVQND5afP3nmgNdrdjI227ASXm
         vr1NQmNHtxvof8mhDMYhIaXb4hON7jWdw6w75cCEJBe1LxtxXk3bYjl3v+s4zDC4Zj8c
         gKuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mZGGAbQVRBkDZyExP7ffjlyLb6N0sV9F4cgg4l8gSxE=;
        b=t1I9jgCwMZKg6fDi8ANtKLjh8wZy43ve3Ua1QxVLSNviZQEJopHEXUVqq6vHwgCQpg
         JNJP6z/XsSAGXpp0cG4preA/okV8vGvANR/cmi25wTrz9kgPZvaO+pSsvWmX3kRakC31
         JVZT0i7Z5uZjjchgqBB9NSGas8OumJrqD/UMgh6qIbk/PXJyKXPe8J/a7SSxA5BKHqZ7
         LWbmMKZp0masqsNha72TDBisEX+UfvP/F5L+mlQdVyf4jprxGTN/R9cWG5EmWnOwg2yg
         pTaaCTMXcvvobmKoHxOWZgKSK2Ei8b5H+iCGhJ1mjT3lIq3cpaLbCy1EXFYG6FL9RaJh
         oFkQ==
X-Gm-Message-State: ANoB5pl8h4wc/x7e0Dwuf6DOgoy/BDl5/FpZk0348Sh8ZjlSeLo9Rf3G
	yumjgxdd33hCZdzsPG96hT8dzQ==
X-Google-Smtp-Source: AA0mqf6wKiTjKYxvtjsF4TJ4YPeSr0mdEUQ+pw8A+HZdflt1p0dm9sIfWC/e+svu0siqN7xcA8Vb/g==
X-Received: by 2002:a05:6214:209:b0:4bb:6bbd:8c1b with SMTP id i9-20020a056214020900b004bb6bbd8c1bmr9012796qvt.111.1669226143925;
        Wed, 23 Nov 2022 09:55:43 -0800 (PST)
Received: from ziepe.ca (hlfxns017vw-47-55-122-23.dhcp-dynamic.fibreop.ns.bellaliant.net. [47.55.122.23])
        by smtp.gmail.com with ESMTPSA id o18-20020a05620a111200b006faaf6dc55asm11988986qkk.22.2022.11.23.09.55.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Nov 2022 09:55:43 -0800 (PST)
Received: from jgg by wakko with local (Exim 4.95)
	(envelope-from <jgg@ziepe.ca>)
	id 1oxtyI-00Afdu-Dk;
	Wed, 23 Nov 2022 13:55:42 -0400
Date: Wed, 23 Nov 2022 13:55:42 -0400
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Matthew Wilcox <willy@infradead.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Maximilian Luz <luzmaximilian@gmail.com>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	linux-kernel@vger.kernel.org, Jens Axboe <axboe@kernel.dk>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Len Brown <lenb@kernel.org>,
	Stefan Richter <stefanr@s5r6.in-berlin.de>,
	Wolfram Sang <wsa@kernel.org>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	Sean Young <sean@mess.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rob Herring <robh+dt@kernel.org>,
	Frank Rowand <frowand.list@gmail.com>,
	Hans de Goede <hdegoede@redhat.com>,
	Mark Gross <markgross@kernel.org>, Vinod Koul <vkoul@kernel.org>,
	Bard Liao <yung-chuan.liao@linux.intel.com>,
	Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
	Sanyog Kale <sanyog.r.kale@intel.com>,
	Andreas Noever <andreas.noever@gmail.com>,
	Michael Jamet <michael.jamet@intel.com>,
	Mika Westerberg <mika.westerberg@linux.intel.com>,
	Yehezkel Bernat <YehezkelShB@gmail.com>,
	Jiri Slaby <jirislaby@kernel.org>,
	Heikki Krogerus <heikki.krogerus@linux.intel.com>,
	"Martin K. Petersen" <martin.petersen@oracle.com>,
	Chaitanya Kulkarni <kch@nvidia.com>, Ming Lei <ming.lei@redhat.com>,
	Jilin Yuan <yuanjilin@cdjrlc.com>,
	Alan Stern <stern@rowland.harvard.edu>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	Ira Weiny <ira.weiny@intel.com>,
	Dan Williams <dan.j.williams@intel.com>,
	Won Chung <wonchung@google.com>, alsa-devel@alsa-project.org,
	devicetree@vger.kernel.org, linux-acpi@vger.kernel.org,
	linux-block@vger.kernel.org, linux-i2c@vger.kernel.org,
	linux-i3c@lists.infradead.org, linux-input@vger.kernel.org,
	linux-media@vger.kernel.org, linux-serial@vger.kernel.org,
	linux-usb@vger.kernel.org, linux1394-devel@lists.sourceforge.net,
	platform-driver-x86@vger.kernel.org
Subject: Re: [PATCH 3/5] driver core: make struct device_type.uevent() take a
 const *
Message-ID: <Y35enjI+dhhqiG3B@ziepe.ca>
References: <20221123122523.1332370-3-gregkh@linuxfoundation.org>
 <711d5275-7e80-c00d-0cdc-0f3d52175361@gmail.com>
 <Y34hgIW8p1RlQTBB@smile.fi.intel.com>
 <97be39ed-3cea-d55a-caa6-c2652baef399@gmail.com>
 <Y34zyzdbRUdyOSkA@casper.infradead.org>
 <Y34+V2bCDdqujBDk@kroah.com>
 <Y35JfNJDppRp5bLX@ziepe.ca>
 <Y35R+/eQJYI7VaDS@kroah.com>
 <Y35YlI93UBuTfgYy@ziepe.ca>
 <Y35dMIaNYSE0Cykd@casper.infradead.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <Y35dMIaNYSE0Cykd@casper.infradead.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221123_095545_384764_A653B69A 
X-CRM114-Status: GOOD (  11.60  )
X-Mailman-Approved-At: Fri, 25 Nov 2022 13:21:10 -0800
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

On Wed, Nov 23, 2022 at 05:49:36PM +0000, Matthew Wilcox wrote:
> On Wed, Nov 23, 2022 at 01:29:56PM -0400, Jason Gunthorpe wrote:
> > #define generic_container_of(in_type, in, out_type, out_member) \
> > 	_Generic(in,                                        \
> >                   const in_type *: ((const out_type *)container_of(in, out_type, out_member)),   \
> >                   in_type *: ((out_type *)container_of(in, out_type, out_member)) \
> > 		  )
> 
> There's a neat trick I found in seqlock.h:
> 
> #define generic_container_of(in_t, in, out_t, m)			\
> 	_Generic(*(in),							\
> 		const in_t: ((const out_t *)container_of(in, out_t, m)), \
> 		in_t: ((out_t *)container_of(in, out_type, m))	\
> 	)
>
> and now it fits in 80 columns ;-)

Aside from less letters, is their another benifit to using *(in) ?

Jason

-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
