Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8E46FC52D7C
	for <linux-i3c@archiver.kernel.org>; Fri,  9 Aug 2024 13:57:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=qUJo2mGZYGlPuSmwp3AZKXDVi884HQztQc8+lm17oZY=; b=ze+PPpCdenQF7Q
	ivsGz7tA6rJr37hAcFmFe4MgaTDPzjeewEWnJjRff0JoWDH33L4xXvArJn+v0e6/IJBCy0J8VDvf8
	fwIqdWVLRcMBq1RLIrYwo74/AFdBV3gjKJ108mlgH6g06wOpBco3EpEUs+xDD54/QSj4MkAt1cr06
	LhHpbvpwnmpMtUvCD33cuzvPlAeCZzlRAvi7JeMmjHf6sW/yUYCalnl42+os2DhhjSRtjlw/zxxxw
	56V7PpD99/je4wSsNGL74UU/kn+vOgQoOoWjO2QWCdhoWqPlzmbb7JeeVn5qBDK6uom6Ey7ktte+2
	qnRg3b0qRJmrJWx1l26Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1scQ7N-0000000BQpo-0JYa;
	Fri, 09 Aug 2024 13:57:21 +0000
Received: from mgamail.intel.com ([192.198.163.8])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1scQ4Y-0000000BQ7F-2zvh
	for linux-i3c@lists.infradead.org;
	Fri, 09 Aug 2024 13:54:28 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1723211666; x=1754747666;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=GQAmDMevSFWVakuf2z9ooWzz8BNB5oGbvOF1VJq1nYM=;
  b=E9Dmo0fwme0Qeiku0wl2KeKkswmLGW3Q1cNnDmuRym7+dnNPdsBL41A1
   hab39pkLa5G379w4R4Ud8epwAPwIUpUt1b09EM477iRHSci8CIMdIgcyw
   l9LIiKou9rkaieNWzkk/7x6g+eCDbHJdAEmVzdYQ2B4EQcr5X9zK1lB6A
   RoISstzPdpDz8Edenw5W/1mH8ooJ3/IojTX8DdLzaMfehJrrqUt+yzjO0
   7rySkdEWiupdDrA1zRX9MzRpePVlmIOx2sClJ5wK5jqf55qL/cggImFjS
   uAgiY39rVQlvILQEO+5SrxcvTQS7d7qjYnSXBEhdnq7p518qpJkIFUNLx
   A==;
X-CSE-ConnectionGUID: Dk5OWOTXRmeLeQr6iSJrgA==
X-CSE-MsgGUID: 5XMAzqc1ReytSeFoxjl4sQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11158"; a="38890978"
X-IronPort-AV: E=Sophos;i="6.09,276,1716274800"; 
   d="scan'208";a="38890978"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Aug 2024 06:54:23 -0700
X-CSE-ConnectionGUID: AHPjV8aYSXStf+dyrMH8Yw==
X-CSE-MsgGUID: DPrllZEEShK4RsT0b3I0oA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,276,1716274800"; 
   d="scan'208";a="57787447"
Received: from unknown (HELO [10.237.72.57]) ([10.237.72.57])
  by orviesa006.jf.intel.com with ESMTP; 09 Aug 2024 06:54:20 -0700
Message-ID: <e94efd42-bc3f-4003-8ad8-2da6500f0f13@linux.intel.com>
Date: Fri, 9 Aug 2024 16:54:18 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RESEND v3 1/6] i3c: mipi-i3c-hci: Add MIPI0100 ACPI ID to
 the I3C Support List
To: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc: Guruvendra Punugupati <Guruvendra.Punugupati@amd.com>,
 Krishnamoorthi M <krishnamoorthi.m@amd.com>, linux-i3c@lists.infradead.org,
 linux-kernel@vger.kernel.org,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 "Rafael J. Wysocki" <rafael@kernel.org>
References: <20240807052359.290046-1-Shyam-sundar.S-k@amd.com>
 <20240807052359.290046-2-Shyam-sundar.S-k@amd.com>
Content-Language: en-US
From: Jarkko Nikula <jarkko.nikula@linux.intel.com>
In-Reply-To: <20240807052359.290046-2-Shyam-sundar.S-k@amd.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240809_065426_797260_B09A48B5 
X-CRM114-Status: GOOD (  14.39  )
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

I Cc'ed Andy and Rafael because of ACPI ID allocation question that came 
to my mind below which I'm not expert enough to answer.

On 8/7/24 8:23 AM, Shyam Sundar S K wrote:
> The current driver code lacks the necessary plumbing for ACPI IDs,
> preventing the mipi-i3c-hci driver from being loaded on x86
> platforms that advertise I3C ACPI support.
> 
> This update adds the MIPI0100 ACPI ID to the list of supported IDs.
> 
> Signed-off-by: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
> ---
>   drivers/i3c/master/mipi-i3c-hci/core.c | 7 +++++++
>   1 file changed, 7 insertions(+)
> 
> diff --git a/drivers/i3c/master/mipi-i3c-hci/core.c b/drivers/i3c/master/mipi-i3c-hci/core.c
> index 4e7d6a43ee9b..24dd4603d6c6 100644
> --- a/drivers/i3c/master/mipi-i3c-hci/core.c
> +++ b/drivers/i3c/master/mipi-i3c-hci/core.c
> @@ -834,12 +834,19 @@ static const __maybe_unused struct of_device_id i3c_hci_of_match[] = {
>   };
>   MODULE_DEVICE_TABLE(of, i3c_hci_of_match);
>   
> +static const struct acpi_device_id i3c_hci_acpi_match[] = {
> +	{"MIPI0100"},
> +	{}
> +};

I started thinking that because of quirks would AMD need to allocate an 
own ACPI ID for each of your HW version and not use generic MIPI ID?

Then passing AMD specific quirks would be easy via driver_data here.



-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
