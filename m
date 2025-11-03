Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 22D43CCFA03
	for <linux-i3c@archiver.kernel.org>; Mon,  3 Nov 2025 08:15:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=tpSKS69RzF97qKzVkiMVXE0q33Wzxqe6T62JcNiGZfo=; b=TNTMgcS0fMEXtc
	bDXUzlWBy4v2ceKhhLp5t5wRyrnJ9RDc0acrXFWvss+JdRWyNjEvgNOF1nHD5dzFCjC/8NnfVzQJ/
	mMn48J4B13UP/JkIOyLyV+10DYv1pNO1dHEPzZIVCmBO9O2bKZG4YrpcAR0OEx+D4bJM5C5Ew5l0s
	t0gcn0VjuLLyfytla3flvWB1ORvwTWYwajgUbx13RXQWVg6OW45jcFacSmzMyr02lYSg5qRzUaPNA
	kkWDS5hu7Jjwr35n/IXFGmh5tELhanYPKYLxU9JS+A9NdtSmxyocHDPwZQyawPFq3VwGNB3UJTYi/
	UHSfjmOA9IIjFw5cISnw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vFpip-00000009Pyu-3Cc9;
	Mon, 03 Nov 2025 08:15:27 +0000
Received: from mgamail.intel.com ([198.175.65.9])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vFpim-00000009PyX-3j1R
	for linux-i3c@lists.infradead.org;
	Mon, 03 Nov 2025 08:15:26 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1762157725; x=1793693725;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=VufkWrtuA/KSjpuq1x6sOOrO8BVr8XELL5F/FJgAris=;
  b=FvbJ0XVGV9OnfSQKa5ZuSA7EpIJynLhwJovU8+G7nBsbe8I65lFDWNJo
   DEIsGIyxzXgdiboGxgyYPNPpSFCP3qLMDAlwzvZiru9uYpe7dRsPJJY4t
   rg8vO0VAaumtq5uhMdzEe2mL6sFXxECagL3Cjcxi5V0uf0bBr1Vn5DvKt
   OR6wbqkOHW+mm8PzCZ0MjZkMt7UDl39fq93RNnLnfrzkOLkNtLmMJML6g
   82QpViBRb0VEQM7IdM+Kcm9ADWQVW+4r1f5NMjH5kObSIr/TiBDqEzsUm
   wWsMNR/bFsD9nLNA7rPpfDs+sVXRn0NZC77w0ky7bmSmT1QDojsQLRJAp
   A==;
X-CSE-ConnectionGUID: ABRSCEWUQdiOZHu0qbejZA==
X-CSE-MsgGUID: AKRMJf76Qoixb0u3aRw7kA==
X-IronPort-AV: E=McAfee;i="6800,10657,11601"; a="86850279"
X-IronPort-AV: E=Sophos;i="6.19,275,1754982000"; 
   d="scan'208";a="86850279"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Nov 2025 00:15:24 -0800
X-CSE-ConnectionGUID: xxrSDRuvS4a2Km8/zCjM/A==
X-CSE-MsgGUID: jgG0tFbES6C1Q/WdN6bt/g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,275,1754982000"; 
   d="scan'208";a="191914908"
Received: from smoehrl-linux.amr.corp.intel.com (HELO ashevche-desk.local) ([10.124.220.216])
  by fmviesa004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Nov 2025 00:15:20 -0800
Received: from andy by ashevche-desk.local with local (Exim 4.98.2)
	(envelope-from <andriy.shevchenko@intel.com>)
	id 1vFpib-000000055PN-1HjE;
	Mon, 03 Nov 2025 10:15:13 +0200
Date: Mon, 3 Nov 2025 10:15:12 +0200
From: Andy Shevchenko <andriy.shevchenko@intel.com>
To: Jonathan Cameron <jic23@kernel.org>
Cc: Frank Li <Frank.Li@nxp.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	David Lechner <dlechner@baylibre.com>,
	Nuno =?iso-8859-1?Q?S=E1?= <nuno.sa@analog.com>,
	Andy Shevchenko <andy@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, linux-i3c@lists.infradead.org,
	linux-kernel@vger.kernel.org, imx@lists.linux.dev,
	linux-iio@vger.kernel.org, joshua.yeong@starfivetech.com,
	devicetree@vger.kernel.org, linux@roeck-us.net,
	Carlos Song <carlos.song@nxp.com>,
	Conor Dooley <conor.dooley@microchip.com>,
	Adrian Fluturel <fluturel.adrian@gmail.com>
Subject: Re: [PATCH v9 0/6] i3c: Add basic HDR mode support
Message-ID: <aQhkkEh5C6vl2nbT@smile.fi.intel.com>
References: <20251031-i3c_ddr-v9-0-f1e523ebaf78@nxp.com>
 <20251101162525.44c9862b@jic23-huawei>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20251101162525.44c9862b@jic23-huawei>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251103_001524_993943_643E000F 
X-CRM114-Status: UNSURE (   6.90  )
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

On Sat, Nov 01, 2025 at 04:25:25PM +0000, Jonathan Cameron wrote:
> On Fri, 31 Oct 2025 12:39:12 -0400
> Frank Li <Frank.Li@nxp.com> wrote:

> Assuming everyone is happy with this version,

Almost. Some nit-picks, but the main comments are:
1) arrays out of a single entry;
2) seems unneeded calls to regmap_dev_attach().

-- 
With Best Regards,
Andy Shevchenko



-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
