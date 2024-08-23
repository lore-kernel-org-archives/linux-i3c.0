Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 92AA4C531DC
	for <linux-i3c@archiver.kernel.org>; Fri, 23 Aug 2024 12:48:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:To:Subject:MIME-Version:
	Date:Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=evz5CwuyOlFxrbPtQqeG90/98hiwATu9ZvLPvS/Bpmg=; b=mD3r8k6uG1VF2YcCYKCNpplPtF
	yXymy8Yan+m09U5b3EKR5gs4qFTJ+cn5gyzx7xKRltjkivZLwC0y5Mq7Sd0gMIsjapxaMpvjmMjgJ
	WyD8tXxnx9onHylqeD+ICC+h2I6WuFEXHY2zlraHrmBwZz4NPxk9MUbDmx64h/rgNWf7tb2xXdAZq
	rPa8OPgVwSDSpbF03qoX09TD679OUwlK16bddPy4ANFsMc045xDuxBchpmSSiC/DY/8rXqNpef8wK
	gng7ezb9S+KJpMWSEUEhI0UoX0HaWfaXFVeb6gpHNGE1cFAxWVm9iSq0uLn/zbNIpPAG2yrmzLPyC
	inMazNXA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1shTiF-0000000Gkiw-0B0j;
	Fri, 23 Aug 2024 12:48:19 +0000
Received: from mgamail.intel.com ([192.198.163.13])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1shTiB-0000000Gkff-0CnP
	for linux-i3c@lists.infradead.org;
	Fri, 23 Aug 2024 12:48:16 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1724417295; x=1755953295;
  h=message-id:date:mime-version:subject:to:references:from:
   in-reply-to:content-transfer-encoding;
  bh=IAqcMqU8mCp77ZE2JJJNSsjrrmdmH41CGEMxBizPaSQ=;
  b=fLWRxDcpqa/S+qLYx3XfJP+sJ06OHBSIAkaGQd6hr9SG9QeBbu2sIuFJ
   OAnaJLEMQS+zPV+ldUM+ooE4CKBV0wxKuiNTnBYpIJm1vR6/wAW1HXyub
   iHbI9Rj3Vz6DgvJR/fML4anjs54545ea66Q1vbhmA/sOTot4NHP5FFyeS
   VEOSVzq1TrJNGhpcL0T7fSEi1k3KabOFkca0KpOE40WeMcRfMtKlr4DdY
   Sw+ZC2UDlgn7rO9k6/KljBLZd6GZnZTzR8x8Q4HNC9scUO08NOTdXEzLM
   myxyYCuUhIMZU//dPpjuHzV3jSh9CNGrLFEKx09sVLdNnA4LGilxTcF95
   g==;
X-CSE-ConnectionGUID: EvdSTKnXQXKEq2eeKcbXqg==
X-CSE-MsgGUID: DBK4ynnWRoO0EQNQ7v4BCQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11172"; a="25777034"
X-IronPort-AV: E=Sophos;i="6.10,170,1719903600"; 
   d="scan'208";a="25777034"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Aug 2024 05:48:12 -0700
X-CSE-ConnectionGUID: 7VIo5akBRryUwe8G7Xjlig==
X-CSE-MsgGUID: YIMoobw5Se6RXftgBh8F1w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,170,1719903600"; 
   d="scan'208";a="62507011"
Received: from mylly.fi.intel.com (HELO [10.237.72.154]) ([10.237.72.154])
  by orviesa008.jf.intel.com with ESMTP; 23 Aug 2024 05:48:10 -0700
Message-ID: <473d838e-7b19-46b7-99a1-73fb8037188b@linux.intel.com>
Date: Fri, 23 Aug 2024 15:48:09 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] i3c/master: cmd_v1: Fix the exit criteria for the daa
 procedure
To: Billy Tsai <billy_tsai@aspeedtech.com>, alexandre.belloni@bootlin.com,
 linux-i3c@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20240823062535.3073706-1-billy_tsai@aspeedtech.com>
Content-Language: en-US
From: Jarkko Nikula <jarkko.nikula@linux.intel.com>
In-Reply-To: <20240823062535.3073706-1-billy_tsai@aspeedtech.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240823_054815_133933_BBCE5091 
X-CRM114-Status: GOOD (  15.42  )
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

On 8/23/24 9:25 AM, Billy Tsai wrote:
> The exit criteria for the DAA should check if the data length is equal to
> 1, instead of checking if the response status is equal to 1.
> 
> Signed-off-by: Billy Tsai <billy_tsai@aspeedtech.com>
> ---
>   drivers/i3c/master/mipi-i3c-hci/cmd_v1.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/i3c/master/mipi-i3c-hci/cmd_v1.c b/drivers/i3c/master/mipi-i3c-hci/cmd_v1.c
> index d97c3175e0e2..6a781f89b0e4 100644
> --- a/drivers/i3c/master/mipi-i3c-hci/cmd_v1.c
> +++ b/drivers/i3c/master/mipi-i3c-hci/cmd_v1.c
> @@ -339,7 +339,7 @@ static int hci_cmd_v1_daa(struct i3c_hci *hci)
>   			break;
>   		}
>   		if (RESP_STATUS(xfer[0].response) == RESP_ERR_NACK &&
> -		    RESP_STATUS(xfer[0].response) == 1) {
> +		    RESP_DATA_LENGTH(xfer->response) == 1) {
>   			ret = 0;  /* no more devices to be assigned */
>   			break;
>   		}
Did you accidentally resend this from a local tree? Is this the same 
than your commit cbf871e6d8ce ("i3c/master: cmd_v1: Fix the exit 
criteria for the daa procedure")?

-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
