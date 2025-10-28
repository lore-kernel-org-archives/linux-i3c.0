Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BAF94CCF9E0
	for <linux-i3c@archiver.kernel.org>; Tue, 28 Oct 2025 14:53:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=EXwAUa37iL6t0GNDJ5WoWeeY88tFgZZzDwjhhIzwibk=; b=lJ5TgMliaSe6xg
	lKz16K7dUViLIAZkjNylYL5IshdfV7tu4jgP2nbZUk2R3X7UxWUiVYli51TjPgOFLAigrqrEtlmku
	0ufrRIgjDijzFeXwfrgzHxDx3eEpn8yf9X/QHT3AAtohmwmBCcsh5u094DjxoB4rO1hAgceEFllnA
	mZowBdbHb+EGiySBnJhpgp4jSHNGKf7fVH+1yKWp1R8bryngIeIRUbRTTtWSh/6E+5RXzL4sju4zF
	Lo+Wt1+3qSLQ8l0FeJ6ehbM3+Bhopo3z7TiZedJG3avaUB3ulgFwz4SuyfzW5qt3yzu+IU22fN5rq
	TIfi5HrPHkw7evVKPlYA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vDl5C-0000000G7eW-3IPW;
	Tue, 28 Oct 2025 14:53:59 +0000
Received: from mgamail.intel.com ([192.198.163.15])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vDl58-0000000G7e0-1HXw
	for linux-i3c@lists.infradead.org;
	Tue, 28 Oct 2025 14:53:58 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1761663234; x=1793199234;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=mi5dp4FJzNlz74atslUNZlo0HuAOGR5OEssnOLjHZXw=;
  b=gfO4cJPZ7DOkP8QyrQaJiVQWHrdlhenZN4Dyvb24Kd0B1bmH7X62jx6+
   pRO5gkJFBkMfUPDmkRLOVHksjCCIrQjBtTshYOG8NcBybryUKmxiH5Pkq
   rLBoCGO+QARrDArhiJimc7/AP6Y3b1wSwRFlVLBFsq/j2PjA+dhDxxJXF
   9yz0+11p+ryM4GLgqAzq49wxUmXPNGyDF4js/B465sPmNhuaOS1hA+PrF
   YwpPjGOgFvP0QeTFifcsfn+zDRre8W3o6H0HKLzSe350G/XlB/5nuPe5d
   ErURKM14usm+BaSqOKkQuMkeDNH5jrGFZlByddnW61Hhdp5EYGWJMXNDA
   w==;
X-CSE-ConnectionGUID: YxSX7dICQW2N4Lu7l53sbA==
X-CSE-MsgGUID: wkcqbOYzTD2rA7gmjjVpRA==
X-IronPort-AV: E=McAfee;i="6800,10657,11586"; a="63859466"
X-IronPort-AV: E=Sophos;i="6.19,261,1754982000"; 
   d="scan'208";a="63859466"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Oct 2025 07:53:54 -0700
X-CSE-ConnectionGUID: rgJB7n3+SFOXyrXLC2uGKw==
X-CSE-MsgGUID: qaBRj9teRIeLIp8szEYJ4A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,261,1754982000"; 
   d="scan'208";a="186114724"
Received: from dalessan-mobl3.ger.corp.intel.com (HELO ashevche-desk.local) ([10.245.244.136])
  by fmviesa010-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Oct 2025 07:53:50 -0700
Received: from andy by ashevche-desk.local with local (Exim 4.98.2)
	(envelope-from <andriy.shevchenko@intel.com>)
	id 1vDl51-00000003LN6-1Dhh;
	Tue, 28 Oct 2025 16:53:47 +0200
Date: Tue, 28 Oct 2025 16:53:47 +0200
From: Andy Shevchenko <andriy.shevchenko@intel.com>
To: Frank Li <Frank.Li@nxp.com>
Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	Jonathan Cameron <jic23@kernel.org>,
	David Lechner <dlechner@baylibre.com>,
	Nuno =?iso-8859-1?Q?S=E1?= <nuno.sa@analog.com>,
	Andy Shevchenko <andy@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, linux-i3c@lists.infradead.org,
	linux-kernel@vger.kernel.org, imx@lists.linux.dev,
	linux-iio@vger.kernel.org, joshua.yeong@starfivetech.com,
	devicetree@vger.kernel.org, Carlos Song <carlos.song@nxp.com>,
	Adrian Fluturel <fluturel.adrian@gmail.com>
Subject: Re: [PATCH v8 6/6] iio: magnetometer: Add mmc5633 sensor
Message-ID: <aQDY-9CEOlA74A-N@smile.fi.intel.com>
References: <20251028-i3c_ddr-v8-0-795ded2db8c2@nxp.com>
 <20251028-i3c_ddr-v8-6-795ded2db8c2@nxp.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20251028-i3c_ddr-v8-6-795ded2db8c2@nxp.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251028_075354_360013_B6741892 
X-CRM114-Status: UNSURE (   6.00  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-i3c" <linux-i3c-bounces@lists.infradead.org>
Errors-To: linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org

On Tue, Oct 28, 2025 at 10:49:02AM -0400, Frank Li wrote:
> Add mmc5633 sensor basic support.
> - Support read 20 bits X/Y/Z magnetic.
> - Support I3C HDR mode to send start measurememt command.
> - Support I3C HDR mode to read all sensors data by one command.

Seems you missed my comments against v7
https://lore.kernel.org/linux-iio/20251027-i3c_ddr-v7-0-866a0ff7fc46@nxp.com/T/#m377b66850dc0205c3b8723d09c647b545b029fbd


-- 
With Best Regards,
Andy Shevchenko



-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
