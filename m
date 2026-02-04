Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 01957E9D408
	for <linux-i3c@archiver.kernel.org>; Wed,  4 Feb 2026 16:26:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=81jGnx4n7hHu/EjumFB8Y3tXp1u6JPgi7CqJj7tp0N4=; b=JlqXy3BWKteRIZ
	DQdRD65MxwFbvu+8qfe9kX6BnkQi9tZa135HuIksbju5Uq7Yb818DryZrKnnwbf44bAnoPXPDzOu5
	Cat8DuZj67cMIkM/0SvROpD+AU0a5tVETHYK/GhedqXwyYai0WWKRMSDYTZiOblplD4zJe/AGNLIp
	KCEX9ISIVi4qCZFINebOVQ6kCWsDE22qaTwgfaP9JkXwM9Orwes2r7vA/EZs62Pe8hm9X59K3vA0t
	AmaSpDl4WnHvivlX2M6Dcm7Ioy8BKTEG5rJqB6Gp5DH2bjpOGk98qBY5vETtUJEvdCJk+yLXO3T0/
	Pam4/iJDGZM4R/fiRfgA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vnfhq-00000008ko4-2Vxz;
	Wed, 04 Feb 2026 16:26:18 +0000
Received: from smtpout-03.galae.net ([185.246.85.4])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vnfhm-00000008knc-3ISa
	for linux-i3c@lists.infradead.org;
	Wed, 04 Feb 2026 16:26:17 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id CB1214E423F6;
	Wed,  4 Feb 2026 16:26:10 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 90D9960705;
	Wed,  4 Feb 2026 16:26:10 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 0EB73119A865B;
	Wed,  4 Feb 2026 17:26:04 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1770222369; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 in-reply-to:references; bh=zO7oO5YPmurdh89afOzZxvMCrA7qucpLwNWj2f6vSpc=;
	b=jnRg/+VRRxbmTQybzDcNAcR6hcQBW7sniRRadB9jMBTXd+uYf6SFKmgdM9R89jQ3D0aTOV
	SWCNYqsTpBt92GnXuv7eN0HdJcLJKx+2agJvuQs5kwe1GCBUeox5Y5fhGELZNNWSu037cK
	AOI1PTRpLkclBxAhhxyukyS8N3lhjAdrgy9iL48aNDAqEmznLz4s6EVcLJr6FlNW4PuoPp
	mEzXbbNZE7URuQS7c9IG5zTUoZvIT7uAp0EDsBwMGzi/H40ZlTk/ZRuGdRMyuR6et7stLN
	dOqqZoye1FHsika1ULclHifTFi/0YgCU98T+4gTvi0L34AbnHm7apc3eEDRYWA==
Date: Wed, 4 Feb 2026 17:26:04 +0100
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: Jonathan Cameron <jic23@kernel.org>
Cc: Guenter Roeck <linux@roeck-us.net>, Arnd Bergmann <arnd@kernel.org>,
	Arnd Bergmann <arnd@arndb.de>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Andy Shevchenko <andriy.shevchenko@intel.com>,
	Frank Li <Frank.Li@nxp.com>,
	Adrian Fluturel <fluturel.adrian@gmail.com>,
	Carlos Song <carlos.song@nxp.com>,
	David Lechner <dlechner@baylibre.com>,
	Nuno =?iso-8859-1?Q?S=E1?= <nuno.sa@analog.com>,
	Andy Shevchenko <andy@kernel.org>, Jean Delvare <jdelvare@suse.de>,
	linux-hwmon@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-i3c@lists.infradead.org, linux-iio@vger.kernel.org
Subject: Re: [PATCH] [v2] i3c, iio: fix i3c driver dependencies
Message-ID: <20260204162604f55a84b5@mail.local>
References: <20260202160543.3654499-1-arnd@kernel.org>
 <a8f8ee55-3c87-4e9c-a5a9-12929855b86f@roeck-us.net>
 <20260202205011.221c1359@jic23-huawei>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260202205011.221c1359@jic23-huawei>
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260204_082614_958228_A223587A 
X-CRM114-Status: GOOD (  23.19  )
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

On 02/02/2026 20:50:11+0000, Jonathan Cameron wrote:
> On Mon, 2 Feb 2026 09:50:58 -0800
> Guenter Roeck <linux@roeck-us.net> wrote:
> 
> > On 2/2/26 08:04, Arnd Bergmann wrote:
> > > From: Arnd Bergmann <arnd@arndb.de>
> > > 
> > > All combined i2c/i3c drivers appear to suffer from the same link
> > > time problem when CONFIG_I3C is set to 'm':
> > > 
> > > arm-linux-gnueabi-ld: drivers/iio/magnetometer/mmc5633.o: in function `mmc5633_i3c_driver_init':
> > > mmc5633.c:(.init.text+0x30): undefined reference to `i3c_driver_register_with_owner'
> > > 
> > > This was previously fixed several times by marking individual
> > > drivers as 'depends on I2C; depends on I3C || !I3C', but this gets
> > > tedious and is somewhat confusing.
> > > 
> > > Add a Kconfig symbol 'I3C_OR_I2C' to help replace those dependencies,
> > > and use this in all the existing drivers that had already fixed it
> > > as well as the new mmc5633 driver.
> > > 
> > > Fixes: 6e5f6bf2e3f0 ("iio: magnetometer: Add mmc5633 sensor")
> > > Signed-off-by: Arnd Bergmann <arnd@arndb.de>
> > > ---
> > > v2: restore accidentally deleted lines
> > > ---
> > >   drivers/hwmon/Kconfig            |  6 ++----  
> > 
> > For hwmon:
> > 
> > Acked-by: Guenter Roeck <linux@roeck-us.net>
> > 
> Hi Arnd / All,
> 
> I applied a less good fix and the pull request has gone to Greg for
> the IIO bug. I copied the hwmon config you have below.
> 
> So I'm absolutely in favour of this improvement but it's
> probably a case of rebase after rc1 and it goes in next cycle.
> Or maybe Greg could pick a rebased version up on top of char-misc-next?
> 
> So with it rebased,
> Reviewed-by: Jonathan Cameron <jonathan.cameron@huawei.com>

I guess I can pick this up after rc1.


-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
