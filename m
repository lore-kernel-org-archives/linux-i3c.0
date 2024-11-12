Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 905A3D32D7C
	for <linux-i3c@archiver.kernel.org>; Tue, 12 Nov 2024 09:51:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=/OnuGAd3c1GC3p4biVJlUUtuta/JKFRgy/wgN46sWfU=; b=lB+MwM9eT6Futs
	QGZ2//DnmAs1euAEN/lu9BrJoYaSNdAkOVjdFunruwYtVo/DMSxAIvlmo0dDoJChGbqyXzdcO8b2p
	ZiL++myiDdHUg2YunMbhy2asm4jZ8kMU+P2G8w+Lfvgbx7NrnxiRSVGJSDBezRv6LV7L/rBDAtlq1
	83YejDuTqWC9zjqlW5Lh/QISXGjIA6fwiYUysSB0Ow+9kkiR7rqCmTxhcSctOSYA6HNJ5pGA2B1Nl
	z0Pa76WoB/rbKfXDJ6GlJWh5W4J/V6PB7rBIlDkAhePyi+99TDqMlvaFEK7EhXPGf6obEa8dtI1sl
	knMuJLGbR8hTh9ha21OQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tAnYQ-00000002wDJ-3kN9;
	Tue, 12 Nov 2024 09:51:22 +0000
Received: from mgamail.intel.com ([198.175.65.21])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tAnVl-00000002viu-0ynE
	for linux-i3c@lists.infradead.org;
	Tue, 12 Nov 2024 09:48:38 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1731404917; x=1762940917;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=RkKDAdWbtMOyFm3KjYTYuPWh4xG/YdpIQsa4yIHFMPA=;
  b=Z21vGaR8S0bxLg7pv+7UjCIaJ4xY8SIWH4ff5U78pS8jLPtCp5bzqVS9
   KH3SQnIfvq/wBzgg+OWh47YAfot8Zx1uB1H3OtLfyfjg/zXPUlUJECiKV
   Ur9AzXPLVUOEYUR90n9oTxe5gqW8j8qDf4b6B/qjMrgbXzTvJuT/dRXqJ
   psIUCVpSl6prtNEVAxzZl1oZdabYYhGIvUIN8itHFqDa2xB3nMDsSXlFO
   j22woOleuP0fI4wA4vZJUWLQ5GzIIMTzTbMJkHd/qPxHSShCOS/SvQTxR
   f7Zd+2SJ1/J8Mnv8IXNb/dFKRAjOPXcfCbHPvmFMsWQQGy9cMpbXv6Avn
   A==;
X-CSE-ConnectionGUID: N76M5wveTaeiixwaqJAHig==
X-CSE-MsgGUID: apl1bk+fSaezL90c38vfVQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="31191822"
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; 
   d="scan'208";a="31191822"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Nov 2024 01:48:37 -0800
X-CSE-ConnectionGUID: PJ+V/aM9QDiOp18bTYckeQ==
X-CSE-MsgGUID: IvMFK4y9TI6najQuKH7BsA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,147,1728975600"; 
   d="scan'208";a="91394037"
Received: from mylly.fi.intel.com (HELO [10.237.72.151]) ([10.237.72.151])
  by fmviesa003.fm.intel.com with ESMTP; 12 Nov 2024 01:48:35 -0800
Message-ID: <eaca7890-af22-4913-9758-53846ad1ec79@linux.intel.com>
Date: Tue, 12 Nov 2024 11:48:34 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/5] i3c: dw: Add support for AMDI0015 ACPI ID
To: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc: Sanket.Goswami@amd.com, linux-i3c@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <20241108073323.523805-1-Shyam-sundar.S-k@amd.com>
 <20241108073323.523805-2-Shyam-sundar.S-k@amd.com>
 <09cfdd95-c566-4379-be17-2d5e0f0e8357@linux.intel.com>
 <507a8af4-f128-4d73-9d0f-b8a6a15603d3@amd.com>
Content-Language: en-US
From: Jarkko Nikula <jarkko.nikula@linux.intel.com>
In-Reply-To: <507a8af4-f128-4d73-9d0f-b8a6a15603d3@amd.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241112_014837_358870_39B83B83 
X-CRM114-Status: UNSURE (   9.48  )
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-i3c" <linux-i3c-bounces@lists.infradead.org>
Errors-To: linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org

Hi

On 11/12/24 10:48 AM, Shyam Sundar S K wrote:
>> Am I right this and patch 5/5 can be independent from rest of the series?
> 
> Right. 1/5 and 5/5 can be grouped. But rest of the other patches are
> equally important because they drive the usecase.
> 
>>
>> To me it looks these two patches enable bus communication and thus be
>> useful without rest of the series while latter need more discussion
>> (I'll have some notes coming) and Cc'ing linux-acpi.
> 
> I have Cc'ed linux-acpi in this revision. Do you have any feedback for
> patches 2-4 ?
> 
Yes, I'm reviewing them and only the patch 2/5 was Cc'ed to linux-acpi.

Patchset split would serve better in my opinion enabling basic 
communication and have an other set concentrating more complex scenario 
we were try to get input from ACPI folks.

-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
