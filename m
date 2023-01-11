Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A0D9BC678D5
	for <linux-i3c@archiver.kernel.org>; Wed, 11 Jan 2023 13:33:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=S9ZaCnqIE7gqezhjwQUcgvbvDz9mXofwb0pC6+rYv/o=; b=vw2N5l4bR/F2ad
	26+dmmHasgC3qliPgMp4uO8MWZHAzURt3U7gF22ZX4HQi1hmuONr+QqjGhTrQ3SS2JNhTThTzm0xg
	H7ZB0AccxgNiQDOYjzNLoleMATJLxOp/3WV9OCaQFKQECSFMv1hCvaTGL1Y+dm6ZcheIESr55n+MX
	NwQoVIvf6MejX7RJW2+IN/zqXi1KzU+HHfpb8jxq72WtAhzn7FyWKWFB91pOLAOMUq830DhAbY2AY
	alxT0Sym4tFltSNfipOg/YEdwQ+Lnx4FnTX7kLWSPZZK+tM8Ha15pmwT0DPyuPtYQcgfmV8gX5Voy
	bJ1VwNf/oWo6eB2uwxZA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pFbEN-00Bbi7-ND; Wed, 11 Jan 2023 13:33:27 +0000
Received: from ams.source.kernel.org ([145.40.68.75])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pFaJZ-00BHPy-HO
	for linux-i3c@lists.infradead.org; Wed, 11 Jan 2023 12:34:46 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id 10ACDB81BDF;
	Wed, 11 Jan 2023 12:34:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E6B26C433F0;
	Wed, 11 Jan 2023 12:34:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1673440482;
	bh=8ECPtl95jMrSYLYK0fQjZE4iX607dsXxBcoAptHSDRk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=F+WPq2If4Vxd4uFQRjL2LkRRf9V8pa09IzqQRBW1tQo12YsZ1tw3NnSEdj9rdOG24
	 PlCE940j1Xm70AovSQjfwjaDDjU4jllNsj+2/T2FJ+xuUK4kBbks+hXC9XM2NrDpAx
	 GkYicY+nCOlqpN3y4fxSE+L6XAx0BM4IfXvweS2eE86TUtape8hhIHhCRO5cFGxpr/
	 JgjCveVG/zIMVxMJqsZ3Utrc+is98aUhzP09TtW5wCbk1KgWabOxtcqzLvXaFhkSr+
	 EDXqcOQnVTHpAdbyBw2cG64blL2y1hSKYqaiIGyfC+rOBco0FxTU45nRspsjwWgIFb
	 FtTn4Xzb8jzOg==
Date: Wed, 11 Jan 2023 18:04:38 +0530
From: Vinod Koul <vkoul@kernel.org>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-kernel@vger.kernel.org, Jens Axboe <axboe@kernel.dk>,
	Len Brown <lenb@kernel.org>,
	Stefan Richter <stefanr@s5r6.in-berlin.de>,
	Wolfram Sang <wsa@kernel.org>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	Sean Young <sean@mess.org>, Rob Herring <robh+dt@kernel.org>,
	Frank Rowand <frowand.list@gmail.com>,
	Maximilian Luz <luzmaximilian@gmail.com>,
	Hans de Goede <hdegoede@redhat.com>,
	Mark Gross <markgross@kernel.org>,
	Bard Liao <yung-chuan.liao@linux.intel.com>,
	Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
	Sanyog Kale <sanyog.r.kale@intel.com>,
	Andreas Noever <andreas.noever@gmail.com>,
	Michael Jamet <michael.jamet@intel.com>,
	Yehezkel Bernat <YehezkelShB@gmail.com>,
	Jiri Slaby <jirislaby@kernel.org>,
	Heikki Krogerus <heikki.krogerus@linux.intel.com>,
	"Matthew Wilcox (Oracle)" <willy@infradead.org>,
	"Martin K. Petersen" <martin.petersen@oracle.com>,
	Chaitanya Kulkarni <kch@nvidia.com>, Ming Lei <ming.lei@redhat.com>,
	Jilin Yuan <yuanjilin@cdjrlc.com>,
	Alan Stern <stern@rowland.harvard.edu>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Jason Gunthorpe <jgg@ziepe.ca>,
	Thomas Gleixner <tglx@linutronix.de>,
	Ira Weiny <ira.weiny@intel.com>,
	Dan Williams <dan.j.williams@intel.com>,
	Won Chung <wonchung@google.com>, alsa-devel@alsa-project.org,
	devicetree@vger.kernel.org, linux-acpi@vger.kernel.org,
	linux-block@vger.kernel.org, linux-i2c@vger.kernel.org,
	linux-i3c@lists.infradead.org, linux-input@vger.kernel.org,
	linux-media@vger.kernel.org, linux-serial@vger.kernel.org,
	linux-usb@vger.kernel.org, linux1394-devel@lists.sourceforge.net,
	platform-driver-x86@vger.kernel.org,
	"Rafael J . Wysocki" <rafael.j.wysocki@intel.com>,
	Mika Westerberg <mika.westerberg@linux.intel.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>
Subject: Re: [PATCH v2 05/16] driver core: make struct device_type.uevent()
 take a const *
Message-ID: <Y76s3tgPkfGhUzEr@matsya>
References: <20230111113018.459199-1-gregkh@linuxfoundation.org>
 <20230111113018.459199-6-gregkh@linuxfoundation.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230111113018.459199-6-gregkh@linuxfoundation.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230111_043445_736825_7AF471A8 
X-CRM114-Status: GOOD (  12.33  )
X-Mailman-Approved-At: Wed, 11 Jan 2023 05:33:24 -0800
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

On 11-01-23, 12:30, Greg Kroah-Hartman wrote:
> The uevent() callback in struct device_type should not be modifying the
> device that is passed into it, so mark it as a const * and propagate the
> function signature changes out into all relevant subsystems that use
> this callback.

Acked-by: Vinod Koul <vkoul@kernel.org>

-- 
~Vinod

-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
