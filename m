Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D87F2C3DA4A
	for <linux-i3c@archiver.kernel.org>; Fri,  9 Aug 2024 13:21:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=vJtZdvjrA/uFUuxmD9EvytfrC2SNoCMpoy9q4iSwWxY=; b=vrF6FTO88yX7Oh
	qnWk70FSBO1ttCzM39r60LTnm4XUgLYP/wYx81/L/DZvyhQwLV5Bvq4G5uDKe/rRKrTjYshYGkPaB
	BCrad4rah8U2gWV52ygsRQk6hAhpLfJhcCTPQCOnKHakJhMJnZrNhFXp/eoGvWO0qPieCU5NEPeHp
	SeRAJw29RO9Nx2mHhGxGLAa7O9OCPr03qmgqND8NEe0YHdfVSXcdUshpEx3rE9tQYUYMFHVeCk2RK
	Zrj3U0pKnc6qC4+G1K8txOUibY7823z6VixmmbrFU4AMjcKFAwlt413AEX50p2I2OxIirgSEE5Ihi
	Or125KdME/hiaKn4PWFQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1scPYe-0000000BJXA-0bPo;
	Fri, 09 Aug 2024 13:21:28 +0000
Received: from mgamail.intel.com ([198.175.65.16])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1scPYb-0000000BJWl-2pN4
	for linux-i3c@lists.infradead.org;
	Fri, 09 Aug 2024 13:21:27 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1723209686; x=1754745686;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=21XDyHoIvdr2kmFYpi3tjvKxqhkqRnTC/2zgaZaZaJg=;
  b=cZ3dSdoOZ54Vhkf6ymA8dIlQCRg7HaFwSHgyEIs+E0TX2JeTCNpRpKw4
   1UZ6I/VkJdjWJfSKZCwJKdqAL9bRzP195jdnPMOCMHquifCDfLu+mx5J4
   DaFAUGqUe1hWr88gNRv+bp0eLf1jldfNejOuo9tStFB4foF5mZBjKj8NQ
   w/2B7JV8mQJ0W0PXQoihWxU7tbz4ex8oS6VChnG+KbfgmQXodr/Zyx69l
   nXXbs8gLCjeCBpG9EyLM1JWpJ6KINr6VSK92BeIudkrsEofmDw/J1BEpT
   bTtjnJGjHQSPfS9TB4GM9HTxRm63PJAnWip0lBfJeecmHQZ8HgjHf01HG
   Q==;
X-CSE-ConnectionGUID: OOc/O3V1TyaB522VbERn6w==
X-CSE-MsgGUID: +IMcNj1VSAiqbyZozpvT6g==
X-IronPort-AV: E=McAfee;i="6700,10204,11158"; a="21534232"
X-IronPort-AV: E=Sophos;i="6.09,276,1716274800"; 
   d="scan'208";a="21534232"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Aug 2024 06:21:20 -0700
X-CSE-ConnectionGUID: 2kR6hczSQoKB6JEPPB6kqA==
X-CSE-MsgGUID: EpyfFweMQY6Frlz242WdmA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,276,1716274800"; 
   d="scan'208";a="80799493"
Received: from unknown (HELO [10.237.72.57]) ([10.237.72.57])
  by fmviesa002.fm.intel.com with ESMTP; 09 Aug 2024 06:21:18 -0700
Message-ID: <ce725e2b-378c-46ba-86ad-a877de0e1ef4@linux.intel.com>
Date: Fri, 9 Aug 2024 16:21:17 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RESEND v3 2/6] i3c: mipi-i3c-hci: Read HC_CONTROL_PIO_MODE
 only after i3c hci v1.1
To: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc: Guruvendra Punugupati <Guruvendra.Punugupati@amd.com>,
 Krishnamoorthi M <krishnamoorthi.m@amd.com>, linux-i3c@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <20240807052359.290046-1-Shyam-sundar.S-k@amd.com>
 <20240807052359.290046-3-Shyam-sundar.S-k@amd.com>
Content-Language: en-US
From: Jarkko Nikula <jarkko.nikula@linux.intel.com>
In-Reply-To: <20240807052359.290046-3-Shyam-sundar.S-k@amd.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240809_062125_789691_1D4D8C2C 
X-CRM114-Status: GOOD (  15.57  )
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

On 8/7/24 8:23 AM, Shyam Sundar S K wrote:
> The HC_CONTROL_PIO_MODE bit was introduced in the HC_CONTROL register
> starting from version 1.1. Therefore, checking the HC_CONTROL_PIO_MODE bit
> on hardware that adheres to older specification revisions (i.e., versions
> earlier than 1.1) is incorrect. To address this, add an additional check
> to read the HCI version before attempting to read the HC_CONTROL_PIO_MODE
> status.
> 
> Signed-off-by: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
> ---
>   drivers/i3c/master/mipi-i3c-hci/core.c | 5 +++--
>   1 file changed, 3 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/i3c/master/mipi-i3c-hci/core.c b/drivers/i3c/master/mipi-i3c-hci/core.c
> index 24dd4603d6c6..a16da70bdfe1 100644
> --- a/drivers/i3c/master/mipi-i3c-hci/core.c
> +++ b/drivers/i3c/master/mipi-i3c-hci/core.c
> @@ -33,6 +33,7 @@
>   #define reg_clear(r, v)		reg_write(r, reg_read(r) & ~(v))
>   
>   #define HCI_VERSION			0x00	/* HCI Version (in BCD) */
> +#define HCI_VERSION_V1			0x100   /* MIPI HCI Version number V1.0 */
>   
>   #define HC_CONTROL			0x04
>   #define HC_CONTROL_BUS_ENABLE		BIT(31)
> @@ -756,7 +757,7 @@ static int i3c_hci_init(struct i3c_hci *hci)
>   	/* Try activating DMA operations first */
>   	if (hci->RHS_regs) {
>   		reg_clear(HC_CONTROL, HC_CONTROL_PIO_MODE);
> -		if (reg_read(HC_CONTROL) & HC_CONTROL_PIO_MODE) {
> +		if (regval > HCI_VERSION_V1 && !(reg_read(HC_CONTROL) & HC_CONTROL_PIO_MODE)) {
>   			dev_err(&hci->master.dev, "PIO mode is stuck\n");
>   			ret = -EIO;
>   		} else {

Here's typo and logic is reversed.

-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
