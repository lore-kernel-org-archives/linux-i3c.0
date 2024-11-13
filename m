Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8075CD41C33
	for <linux-i3c@archiver.kernel.org>; Wed, 13 Nov 2024 11:01:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=03IKYORkHLg+g/HuzNqbmOO6cQzGdzFeLTkjfn9iWNE=; b=KB3Wvoi1yMLrRH
	RgJ7UsVWurlFDrO3wb64kU88GWnmu0nz8dWBogKBv9XYoHb428IJUWRDRkJfAoW+CtY2IAStS6XKM
	34wczIKStu/T+41RlWFGBfAPGNWTsbGYh7hWPieHgBEgNF4bk5CO7bHjmnqgjkRPC0BYOQf0iclxC
	AJF9KDfVqxNW7PTqBFZHhkhEUQ6rfjtMG+lwvFF3u0hf/w1dvEFT8HlVBXlfKl4OIgWIDc0yHEU8I
	9fGU+7ChE/YbsumPhB1Jvs8+RkfMzE0xzibe2T61BU0YVEY/DTv/V8X1XCokYZVFPmzvtocgc8vXl
	ClSCdkzZMecSu5UgBSMg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tBB7h-00000006Wlv-2ppB;
	Wed, 13 Nov 2024 11:01:21 +0000
Received: from mgamail.intel.com ([192.198.163.17])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tBAAT-00000006MIQ-3z1m
	for linux-i3c@lists.infradead.org;
	Wed, 13 Nov 2024 10:00:29 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1731492010; x=1763028010;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=XTg1A6VERW2vZuQ8bcofRgH6ca1goDGT1y1rIAqX34s=;
  b=DYf6rix4+bOZT1JaW9exLlJDxx/NLUlxGZRMO8Ak81bdhZ+ggj0wuYgG
   sK17SK/iq400+ONy2pR06biU9vkfY3g3YmBMHUGoaDbPeigzYJB6A3C0q
   eLWjabBW4Li5tYs3rSzMHDU7cYycCCO0KX51Cx8H4vdJD6NyhN+SPqERn
   0yKNZUnSf8kZiSJlPi95w5ujLvuTwvvnnRm8Bqk3pJhOUmBQkYxa7cnE6
   6lcKVy3ycHIiJfvRPitIykDjxJgE3+Ap9zgIcgu/FAr9eGkzlPC2cmoej
   6CwDz4ltNN/SttY1f96DI6DTZW1afTAnE+qO4470tG3NtYbQCGp6r60Jj
   Q==;
X-CSE-ConnectionGUID: a3bjjF+8RSutTpQBI+axDQ==
X-CSE-MsgGUID: eh7HXWIyQxKkhsTT0YMiUw==
X-IronPort-AV: E=McAfee;i="6700,10204,11254"; a="31258419"
X-IronPort-AV: E=Sophos;i="6.12,150,1728975600"; 
   d="scan'208";a="31258419"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Nov 2024 02:00:09 -0800
X-CSE-ConnectionGUID: teOArXzgSayK1TaaOOx2VQ==
X-CSE-MsgGUID: VSWqnHkRQZuZGE60Q0mmYw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,150,1728975600"; 
   d="scan'208";a="91867725"
Received: from mylly.fi.intel.com (HELO [10.237.72.58]) ([10.237.72.58])
  by fmviesa003.fm.intel.com with ESMTP; 13 Nov 2024 02:00:07 -0800
Message-ID: <9a78959a-391b-4a77-a33e-e230fbf2e0c0@linux.intel.com>
Date: Wed, 13 Nov 2024 12:00:06 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 4/5] i3c: master: Add support for SETAASA CCC
To: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc: Sanket.Goswami@amd.com, linux-i3c@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <20241108073323.523805-1-Shyam-sundar.S-k@amd.com>
 <20241108073323.523805-5-Shyam-sundar.S-k@amd.com>
Content-Language: en-US
From: Jarkko Nikula <jarkko.nikula@linux.intel.com>
In-Reply-To: <20241108073323.523805-5-Shyam-sundar.S-k@amd.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241113_020010_067969_03717437 
X-CRM114-Status: GOOD (  12.25  )
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

On 11/8/24 9:33 AM, Shyam Sundar S K wrote:
> @@ -1907,7 +1926,14 @@ static int i3c_master_bus_init(struct i3c_master_controller *master)
>   		goto err_bus_cleanup;
>   	}
>   
> -	i3c_master_add_spd_dev(master, i3cboardinfo);
> +	/*
> +	 * If the I3C slave on the bus is SPD device, then do not follow the regular
> +	 * DAA process. Also, as per SPD spec SETAASA is required for the bus discovery
> +	 * and sending RSTDAA and DISEC is considered as illegal. So skip the entire process
> +	 * if the jdec_spd flag has been identified from the BIOS.
> +	 */
> +	if (master->jdec_spd)
> +		return i3c_master_add_spd_dev(master, i3cboardinfo);
>   
This looks wrong the previous patch adds unconditional call to 
i3c_master_add_spd_dev() and this patch makes it conditional. Can 
previous patch then cause a regression if applied without this one?

>   	if (master->ops->set_speed) {
>   		ret = master->ops->set_speed(master, I3C_OPEN_DRAIN_SLOW_SPEED);
> @@ -2311,6 +2337,10 @@ static int i3c_acpi_configure_master(struct i3c_master_controller *master)
>   		return -ENODEV;
>   	}
>   
> +	status = acpi_evaluate_object(master->ahandle, "_STR", NULL, NULL);
> +	if (ACPI_SUCCESS(status))
> +		master->jdec_spd = true;
> +

I'm still suspicious about this one when existence of _STR for the host 
controller causes normal bus initialization to be skipped. I.e. like below.

Device (I3C0)
{
	_STR ("My I3C Host Controller")
...

-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
