Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 22A2DD41D6A
	for <linux-i3c@archiver.kernel.org>; Tue, 12 Nov 2024 08:16:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=PsA3OlL4mtHXetjpxCmo2Ds/oLSuQ6Sr2KAEdRSPW1s=; b=3wS4RJBvFBXagD
	MpZEG2i+N7gcDl5DuMeJgvvDfh1Gxsv7w3XigZf4z1U6lqdeVDcdl6t6vqhQAxYLddl3VXEtBejXa
	OApKn8svRNnkVc7OB2CLdpSG8tdY7lRILyd5dcG5RqW/bNBuuH/fjW6WGxBzp1deJlA3gi2Eipxrj
	Ufyf4eSOlSQrVYSYh4ff+mQrbyvvcHDMFAmwv16QQ0tgAyBFYk/HW9ijOsFKD6BVawtA7ZuwpFSul
	uTr6lthCD7AoHXJ3pWAu65VsrR6MgsDEdw2rEYQxwxPxLgd0LNOp9UfViD6FSPene0YIOL8WJrJic
	USvjFI4wK6jigFUAvEyg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tAm4U-00000002beh-1n96;
	Tue, 12 Nov 2024 08:16:22 +0000
Received: from mgamail.intel.com ([198.175.65.16])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tAm4Q-00000002bdO-3tA3
	for linux-i3c@lists.infradead.org;
	Tue, 12 Nov 2024 08:16:20 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1731399379; x=1762935379;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=wfPsGh/NtuGCX40RhvU95ybOGuqzMZVTNrnQGmkaCwE=;
  b=grKskjaDwA4te7Uk129tl5BfWaXoKRVmulInZ/dthxH148KnyG63SN4G
   mPfG3b1oZGex6iprSE9eD/+XPBlUbSVhqnEqXIiCT4xAIRCe/icp4UEy6
   dkxGbVju5KGitagGvG1N+XUVxwSEmtv3L3TDNrXFT0MMr+dIlRLPR5M46
   omy23FUTKMRCiQ5Oi2n0HoX2WNeJ3FsxbqJLCsVd5E3S02p5+lb1jt8B6
   +ntfDdrQ9R6wKWfEjr38ghg5sQdC89JsJe1UpLK69CDp/IT2V93ztl6AT
   O4QQfks3dkYhADI/mvcS0UKTGJMlySzlJDJFfp1iWeaRiyy3JOeQqahiH
   Q==;
X-CSE-ConnectionGUID: hJzY/1cUSZ23gMNxi1dG3w==
X-CSE-MsgGUID: 033GxqIWQ7S7nQS4xaPccw==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="31374114"
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; 
   d="scan'208";a="31374114"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Nov 2024 00:16:14 -0800
X-CSE-ConnectionGUID: 8NUvMpJhTs2+8B937cVOcg==
X-CSE-MsgGUID: pdJ1w3pHRDODzglOF2FSuA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,147,1728975600"; 
   d="scan'208";a="92266122"
Received: from mylly.fi.intel.com (HELO [10.237.72.151]) ([10.237.72.151])
  by orviesa005.jf.intel.com with ESMTP; 12 Nov 2024 00:16:13 -0800
Message-ID: <09cfdd95-c566-4379-be17-2d5e0f0e8357@linux.intel.com>
Date: Tue, 12 Nov 2024 10:16:11 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/5] i3c: dw: Add support for AMDI0015 ACPI ID
To: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc: Sanket.Goswami@amd.com, linux-i3c@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <20241108073323.523805-1-Shyam-sundar.S-k@amd.com>
 <20241108073323.523805-2-Shyam-sundar.S-k@amd.com>
Content-Language: en-US
From: Jarkko Nikula <jarkko.nikula@linux.intel.com>
In-Reply-To: <20241108073323.523805-2-Shyam-sundar.S-k@amd.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241112_001619_075895_452F9FC6 
X-CRM114-Status: GOOD (  15.82  )
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
> Add AMDI0015 _HID for Designware I3C driver so that the dw-i3c-master
> driver can be probed on AMD platforms.
> 
> Signed-off-by: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
> ---
>   drivers/i3c/master/dw-i3c-master.c | 7 +++++++
>   1 file changed, 7 insertions(+)
> 
> diff --git a/drivers/i3c/master/dw-i3c-master.c b/drivers/i3c/master/dw-i3c-master.c
> index 8d694672c110..1a7c300b6d45 100644
> --- a/drivers/i3c/master/dw-i3c-master.c
> +++ b/drivers/i3c/master/dw-i3c-master.c
> @@ -1748,12 +1748,19 @@ static const struct of_device_id dw_i3c_master_of_match[] = {
>   };
>   MODULE_DEVICE_TABLE(of, dw_i3c_master_of_match);
>   
> +static const struct acpi_device_id amd_i3c_device_match[] = {
> +	{ "AMDI0015" },
> +	{ }
> +};
> +MODULE_DEVICE_TABLE(acpi, amd_i3c_device_match);
> +
>   static struct platform_driver dw_i3c_driver = {
>   	.probe = dw_i3c_probe,
>   	.remove_new = dw_i3c_remove,
>   	.driver = {
>   		.name = "dw-i3c-master",
>   		.of_match_table = dw_i3c_master_of_match,
> +		.acpi_match_table = amd_i3c_device_match,
>   		.pm = &dw_i3c_pm_ops,
>   	},
>   };

Am I right this and patch 5/5 can be independent from rest of the series?

To me it looks these two patches enable bus communication and thus be 
useful without rest of the series while latter need more discussion 
(I'll have some notes coming) and Cc'ing linux-acpi.

-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
