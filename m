Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5B881CCF9F8
	for <linux-i3c@archiver.kernel.org>; Mon,  3 Nov 2025 18:11:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=+nql+i/oRC4KqzOQ6AfqUQAGWJ6D/XhCRGgMmpg/rWw=; b=Z0b2gbPJ+RE/Er
	tWKnuAmTGsjtM+Y7ZPOVrWybv7D0ZQAd6sgiNG4pTrPvcy8ZXr6ejZ/Z8wHQ3wY0Ar//LpR77/2cP
	G+qR/Bda1o+qnZMGvNJgsnqaScikq8MaZmp6L4xxG9czls0YGeol74AhR+PGiChehdpmO3o8JCYWZ
	kC4LAcM39UlUBsljKWQG4CDG7TUI4OqqjN08J25OZjCU4FnBJPozdKq9U4gH9r2ljokyjV3+sY7oJ
	coe6EsKNvTmVxj78tePTiERuitFecw2jIJrBAVOS5OKyGuK7lUY/P/MAwApYyglnDdizc6eb9cDjD
	MRloNbRez6gBRUn8m9kg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vFz1K-0000000AT6C-0UhY;
	Mon, 03 Nov 2025 18:11:10 +0000
Received: from mgamail.intel.com ([192.198.163.14])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vFz1D-0000000AT4Q-2zU4
	for linux-i3c@lists.infradead.org;
	Mon, 03 Nov 2025 18:11:08 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1762193465; x=1793729465;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=va05Mvt1eD6PFtFEKUpfUa5jMNLoaEZADG41u4Ql/M4=;
  b=c7WfaR0RKVqWvt317YckbykFy2lXeXZCKuAMwtcbj04q6NEvi4/uR5eu
   CWCq8+nWgBDj0NFqcHcBih9L8HokCmkcD0GGXpLXMO1XcIAShCR+pyYGY
   vtHudyXKQethjgDnka1Ma5zoS7gW/PbXJU6rqDU+WsQCCBirsnCO0tsuO
   sQvqI2yw27F2ChyYAb7rlGMSbis7DekD4c4LJCqCubxZJ3gpPBXhlDl28
   ZTI3v6xqxv4GEhnaPejEuL60fd0jxVdb8t08oGALlPlwZeTspYK076jg3
   cOc01xvAAQkL+lazTXbyWR/CFMer8AvzSwAWE2HxKfk1jpBwH3PX69skH
   A==;
X-CSE-ConnectionGUID: U4zAQuJMQ16rFWh3PpZByg==
X-CSE-MsgGUID: Me9q2zG5SzeeDkH7AWNGZQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11602"; a="64310647"
X-IronPort-AV: E=Sophos;i="6.19,276,1754982000"; 
   d="scan'208";a="64310647"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Nov 2025 10:11:03 -0800
X-CSE-ConnectionGUID: lYK2nm35QX+me1Q/Ii1pxg==
X-CSE-MsgGUID: c/gQnkyGRYa3OAlETYavtA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,276,1754982000"; 
   d="scan'208";a="187083144"
Received: from smoehrl-linux.amr.corp.intel.com (HELO ashevche-desk.local) ([10.124.220.216])
  by orviesa008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Nov 2025 10:10:59 -0800
Received: from andy by ashevche-desk.local with local (Exim 4.98.2)
	(envelope-from <andriy.shevchenko@intel.com>)
	id 1vFz12-00000005ERt-0H0D;
	Mon, 03 Nov 2025 20:10:52 +0200
Date: Mon, 3 Nov 2025 20:10:51 +0200
From: Andy Shevchenko <andriy.shevchenko@intel.com>
To: Frank Li <Frank.li@nxp.com>
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
	devicetree@vger.kernel.org, linux@roeck-us.net,
	Carlos Song <carlos.song@nxp.com>,
	Adrian Fluturel <fluturel.adrian@gmail.com>
Subject: Re: [PATCH v9 6/6] iio: magnetometer: Add mmc5633 sensor
Message-ID: <aQjwK2IC1NML2w5F@smile.fi.intel.com>
References: <20251031-i3c_ddr-v9-0-f1e523ebaf78@nxp.com>
 <20251031-i3c_ddr-v9-6-f1e523ebaf78@nxp.com>
 <aQhkRmtJMoB7vv8U@smile.fi.intel.com>
 <aQjQ4jsG6Gc2u3n+@lizhi-Precision-Tower-5810>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <aQjQ4jsG6Gc2u3n+@lizhi-Precision-Tower-5810>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251103_101103_764012_1FA73642 
X-CRM114-Status: GOOD (  11.84  )
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

On Mon, Nov 03, 2025 at 10:57:22AM -0500, Frank Li wrote:
> On Mon, Nov 03, 2025 at 10:13:58AM +0200, Andy Shevchenko wrote:
> > On Fri, Oct 31, 2025 at 12:39:18PM -0400, Frank Li wrote:

...

> > > - 1 -> ARRAY_SIZE()
> >
> > Maybe I missed the answer, but why are the arrays to begin with?
> 
> I3C/I2C transfer API required pass down one array. Keep the same coding
> style with existed one, like
> 
> source/drivers/base/regmap/regmap-i3c.c

I can understand why it's done there (there are read and write and they use
different amount of items in the arrays). But here in your case IIRC there
is only one function that uses predefined arrays out of a single entry. So
I do not see a justification for having an array. OTOH it's not a big deal
and I leave it to Jonathan to decide.

-- 
With Best Regards,
Andy Shevchenko



-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
