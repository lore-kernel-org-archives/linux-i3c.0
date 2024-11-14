Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3E215D65C57
	for <linux-i3c@archiver.kernel.org>; Thu, 14 Nov 2024 08:01:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=aAN+eYppxWyuf5Bx1JRTpJHfW5mnRwovceFeX7SfFaE=; b=SMyL630vVGU7cl
	oip3hDy2+X+KriC0ggNzuvlAB57hqnJPVJHDlHD55jS6yL+CD8XgD2hDw9i/J/35zkTZ/+ylbCBxP
	yRqGL/hJF6r+ikxMV3Zv8ysHQGoi6QwW3uvGdMAgdCOrGMcKiS4iRg5KxTOZGkfY9XR59SAKi3cCH
	4u/IK/JRkD6uM2gLjCYGxZBq20IGivbmU+DTnSjPgdiqLEL30DXS3vrUTvUe2itH1NJ3/t79/Plwo
	GSb/IzL0m/Jy0vDEoIyHYG1AH7RVgZr8/+1rezDiIW52D6D2kmttcE0BiGLt9AdT0Dai+HciXy/t4
	14wp94W/T2GQwLWh+WaA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tBUnL-000000099dk-30Q8;
	Thu, 14 Nov 2024 08:01:39 +0000
Received: from mgamail.intel.com ([198.175.65.14])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tBUnJ-000000099cy-2YUL
	for linux-i3c@lists.infradead.org;
	Thu, 14 Nov 2024 08:01:38 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1731571297; x=1763107297;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=Qka/a3kZTQ8Mhjjbyc+iyeYQhIQ3WxkT3FKtU/EMAC0=;
  b=R7MJA6qUp6tbSsYH+iKgufshdRWXr6LuXS7dKNpswQ6oKfGo/Ctn1gsd
   h45ebbtAwHYI0qjCOlEettJP95qrdBnMxOJeiuKx7e61RwpIn2XK08MGc
   1O0GCDgovNnscSRHEGAz56ilhBE4A8iQAzgv7D/Wd+9xDNwdPZpmHKEKn
   H8L5O17Wra8c9XzPmrIdfeLG9SfkY/YfokkN8D6NZy7nqFwonCO6cTfGX
   iiVowtW2jto1oXbuIJsD7AgROU9Joevilg6yDH7ageGjua+7meUx5cizv
   LNmgwq4K8gSycLnnqyImE3kuZeRoLcnPDNbUPl6oOoiZ9bIaqne4Sh1fF
   w==;
X-CSE-ConnectionGUID: 5ZjevkpkSuWVTmykz6W4sQ==
X-CSE-MsgGUID: Cr9HfH9ZTSuTtVYRe2GMoQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11255"; a="35291041"
X-IronPort-AV: E=Sophos;i="6.12,153,1728975600"; 
   d="scan'208";a="35291041"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Nov 2024 00:01:37 -0800
X-CSE-ConnectionGUID: RSjFbsgUSK2aiPm6Jz9sow==
X-CSE-MsgGUID: 29njlxtzRhaNQOaN1ECwEg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,153,1728975600"; 
   d="scan'208";a="118942742"
Received: from unknown (HELO [10.237.72.151]) ([10.237.72.151])
  by orviesa002.jf.intel.com with ESMTP; 14 Nov 2024 00:01:36 -0800
Message-ID: <6d3f1fd0-1ead-4a01-bb2d-8482f8c1799f@linux.intel.com>
Date: Thu, 14 Nov 2024 10:01:35 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 5/5] i3c: dw: Add quirk to address OD/PP timing issue
 on AMD platform
To: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc: Sanket.Goswami@amd.com, linux-i3c@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <20241108073323.523805-1-Shyam-sundar.S-k@amd.com>
 <20241108073323.523805-6-Shyam-sundar.S-k@amd.com>
Content-Language: en-US
From: Jarkko Nikula <jarkko.nikula@linux.intel.com>
In-Reply-To: <20241108073323.523805-6-Shyam-sundar.S-k@amd.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241114_000137_725149_17E8DD41 
X-CRM114-Status: UNSURE (   8.89  )
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

On 11/8/24 9:33 AM, Shyam Sundar S K wrote:
> The AMD Legacy I3C is having a problem with its IP, specifically with the
> push-pull and open-drain pull-up registers. These registers need to be
> manually programmed for every CCC submission to align with the duty cycle.
> Therefore, add a quirk to address this issue.
> 
> Co-developed-by: Sanket Goswami <Sanket.Goswami@amd.com>
> Signed-off-by: Sanket Goswami <Sanket.Goswami@amd.com>
> Signed-off-by: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
> ---
>   drivers/i3c/master/dw-i3c-master.c | 29 ++++++++++++++++++++++++++++-
>   drivers/i3c/master/dw-i3c-master.h |  1 +
>   2 files changed, 29 insertions(+), 1 deletion(-)
> 
Reviewed-by: Jarkko Nikula <jarkko.nikula@linux.intel.com>

-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
