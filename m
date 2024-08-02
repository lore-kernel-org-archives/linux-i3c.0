Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2E531C3DA4A
	for <linux-i3c@archiver.kernel.org>; Fri,  2 Aug 2024 13:23:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=f+gUt4ae+yia5KSTBG33dtr9EXppTcvWKfHq/Qz+bqE=; b=Esr+oxJdclyLf3
	D5ynQbPiGw4HTp5dc8zzcFA0DetZisWuWrl/FKSihd0tTV2dCR2k7GeJSw4SmoT6B7tGK0tHYwexp
	2tNzBUmUZkpeyXPFXXbXo3sPhpDZW/dQYyCKGmpEUlafTIWGofM5gBIoeHumIri6KCFR/dBQrZxhq
	zX06kT8LALs8xVt7KoyKka6za3zF093JYnRq6muDLQ9IevkJ+ZrfBgaV5Ofaxz+EVDAoiwU3+coRH
	FjB0bhEvp68g215/ToLph0+FWgHzvOjfdjenMKMw1O1ik9oejoFx8viz3XHsrCSC/X23/f1MhmlHl
	vSiBT/fmp2v7Oi0+jqyg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sZsFi-00000008wO0-0o3c;
	Fri, 02 Aug 2024 13:23:26 +0000
Received: from mgamail.intel.com ([198.175.65.21])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sZsFf-00000008wNV-3dxh
	for linux-i3c@lists.infradead.org;
	Fri, 02 Aug 2024 13:23:25 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1722605003; x=1754141003;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=SbzVMvrgqgnN6vDegUB9cL5i+J+RsUNUs2IF58rQ7o4=;
  b=Ah8vZqD5FgRkMaOP9R3c+HZJG++kEos2N3gTe3KB3u8finU5s/VQdKrM
   1HnoLIDM06CnyCqkAOki522Y4JLhLJ0k6tnYRdrVP35Gje3qQlz+6nlEQ
   UeE3Btg1bLs3aLgOYjuHduE8p74ABnrpVjiuh1uvzSvsGP9EoBqObFgvM
   hgGfKrIZoeg+GagfrUQLgpo92dlXE1tQDxoGEowxa7i4aspFJOlZa/Xm3
   dZ2SIN3JbBSoUnF9sSvn2SBaZ9wiwdDwVG1iWHE4m8WwXpEMgElQ/J2JF
   hXd3LjSrDiy5aB0Q+pBaAyLbnDTO7lDBEUzPxxi7Z0rtwijN37PfnhtHJ
   Q==;
X-CSE-ConnectionGUID: QTLo/WXTTd+e4TDCs6aqlg==
X-CSE-MsgGUID: MJ/DgcedR3u2Fa1XiutMvw==
X-IronPort-AV: E=McAfee;i="6700,10204,11152"; a="20571624"
X-IronPort-AV: E=Sophos;i="6.09,257,1716274800"; 
   d="scan'208";a="20571624"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Aug 2024 06:23:22 -0700
X-CSE-ConnectionGUID: Hi/gxvj9Qeeq8I28/TOxqA==
X-CSE-MsgGUID: 1BjErpSTRxqf4IP9A9RHrQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,257,1716274800"; 
   d="scan'208";a="55636314"
Received: from mylly.fi.intel.com (HELO [10.237.72.151]) ([10.237.72.151])
  by orviesa006.jf.intel.com with ESMTP; 02 Aug 2024 06:23:20 -0700
Message-ID: <4808f199-2cc7-4150-ac04-0f36db841f50@linux.intel.com>
Date: Fri, 2 Aug 2024 16:23:19 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/5] i3c: mipi-i3c-hci: Add MIPI0100 ACPI ID to the I3C
 Support List
To: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc: Guruvendra Punugupati <Guruvendra.Punugupati@amd.com>,
 Krishnamoorthi M <krishnamoorthi.m@amd.com>, linux-i3c@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <20240724071245.3833404-1-Shyam-sundar.S-k@amd.com>
 <20240724071245.3833404-2-Shyam-sundar.S-k@amd.com>
Content-Language: en-US
From: Jarkko Nikula <jarkko.nikula@linux.intel.com>
In-Reply-To: <20240724071245.3833404-2-Shyam-sundar.S-k@amd.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240802_062323_989898_F4203C62 
X-CRM114-Status: GOOD (  17.74  )
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

On 7/24/24 10:12 AM, Shyam Sundar S K wrote:
> The current driver code lacks the necessary plumbing for ACPI IDs,
> preventing the mipi-i3c-hci driver from being loaded on x86
> platforms that advertise I3C ACPI support.
> 
> This update adds the MIPI0100 ACPI ID to the list of supported IDs.
> 
> Signed-off-by: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
> ---
> MIPI0100 is the ACPI ID as defined in the MIPI I3C DisCo specification.
> 
>   drivers/i3c/master/mipi-i3c-hci/core.c | 6 ++++++
>   1 file changed, 6 insertions(+)
> 
> diff --git a/drivers/i3c/master/mipi-i3c-hci/core.c b/drivers/i3c/master/mipi-i3c-hci/core.c
> index d7e966a25583..dbc8c38bd962 100644
> --- a/drivers/i3c/master/mipi-i3c-hci/core.c
> +++ b/drivers/i3c/master/mipi-i3c-hci/core.c
> @@ -826,12 +826,18 @@ static const __maybe_unused struct of_device_id i3c_hci_of_match[] = {
>   };
>   MODULE_DEVICE_TABLE(of, i3c_hci_of_match);
>   
> +static const struct acpi_device_id i3c_hci_acpi_match[] = {
> +	{"MIPI0100"},
> +	{}
> +};
> +
>   static struct platform_driver i3c_hci_driver = {
>   	.probe = i3c_hci_probe,
>   	.remove_new = i3c_hci_remove,
>   	.driver = {
>   		.name = "mipi-i3c-hci",
>   		.of_match_table = of_match_ptr(i3c_hci_of_match),
> +		.acpi_match_table = i3c_hci_acpi_match,
>   	},
>   };
>   module_platform_driver(i3c_hci_driver);

Looks otherwise ok to me but is this missing MODULE_DEVICE_TABLE()?

-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
