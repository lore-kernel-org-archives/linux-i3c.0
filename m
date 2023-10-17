Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6E95BCDB484
	for <linux-i3c@archiver.kernel.org>; Tue, 17 Oct 2023 08:33:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:To:Subject:MIME-Version:
	Date:Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=jz+Q+6k0edgFziQe1DJtp9i+Cqe1uE8ERjEKbgrdTrE=; b=AMHOYEaFmojrHpGMtolu85STF+
	xkfdjQsCFn/jprYiTqEVf1h4t+/dsibNDB+UGcbEE9fWe2Phxa4syff5sZKYHaxGU9bzib7OgNRm5
	KRa7HGlabny8ZW+gcTEmOmHlZJlG66JRwtzBQ6mKAFdxbptMPf+bdcghncr5J5swcLSfVA66wpKG2
	tzt9b7Vxk/fXcn29ubDJcgeAajwrwipe95R4A7o0T9pP6XfhhQrDtp4uXeRktrowiu4tvoOoDeFdp
	g8BfgyS1zj3tnyai+7FdBl5ufrpuV5WZethAtJmXs2H+8heLaHkTFIyN6a5gsyMnfptSmsINbrJcm
	z9CiJCOA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qsfWI-00Bh5A-1w;
	Tue, 17 Oct 2023 08:33:42 +0000
Received: from mgamail.intel.com ([192.55.52.120])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qsfWF-00Bh2s-1y
	for linux-i3c@lists.infradead.org;
	Tue, 17 Oct 2023 08:33:40 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1697531619; x=1729067619;
  h=message-id:date:mime-version:subject:to:references:from:
   in-reply-to:content-transfer-encoding;
  bh=MxayT2/XEWdFuARMII+EG5lLXg5UMsqpoavndXRXyTw=;
  b=f7QvggXYhKOdZQgwmCtvkPcWPqdRqkyYmUG0TV5Ky2LKPyL0xwu2JXWb
   HJ6HHzTc4c63zjlqCauVOtW9vq5+Rl168+ns5KCsNUfFqAXKlIL3xhJvI
   T5iEP3MjbodHu8wkhEiCPn+LIqZcvCh4F43UWHdM17SDZY95qI7OEXVBs
   iwCDO2yR2rfXtnC6gXOtmtRdT0Nr82z2QZSEVlO037Rygh04Vma569CRi
   ZFt035LR4ayTOsiqirj9yfqa4SoK5er8oIr09uRxje3f+2toPCO+7Fzoy
   dEed7NrvF1DJSDGr6xtRXlxV/Q3dJUa3ZTfxV59a1P4KhusEg/pbrt3YH
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10865"; a="384608514"
X-IronPort-AV: E=Sophos;i="6.03,231,1694761200"; 
   d="scan'208";a="384608514"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Oct 2023 01:33:37 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10865"; a="826353237"
X-IronPort-AV: E=Sophos;i="6.03,231,1694761200"; 
   d="scan'208";a="826353237"
Received: from mylly.fi.intel.com (HELO [10.237.72.161]) ([10.237.72.161])
  by fmsmga004.fm.intel.com with ESMTP; 17 Oct 2023 01:33:35 -0700
Message-ID: <af35a533-2126-4a61-a6cd-31ed1e615f2b@linux.intel.com>
Date: Tue, 17 Oct 2023 11:33:34 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 4/5] i3c: master: svc return actual transfer data len
Content-Language: en-US
To: Frank Li <Frank.Li@nxp.com>, alexandre.belloni@bootlin.com,
 miquel.raynal@bootlin.com, conor.culhane@silvaco.com, joe@perches.com,
 linux-i3c@lists.infradead.org, linux-kernel@vger.kernel.org,
 imx@lists.linux.dev
References: <20231016154632.2851957-1-Frank.Li@nxp.com>
 <20231016154632.2851957-5-Frank.Li@nxp.com>
From: Jarkko Nikula <jarkko.nikula@linux.intel.com>
In-Reply-To: <20231016154632.2851957-5-Frank.Li@nxp.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231017_013339_660041_E058B178 
X-CRM114-Status: GOOD (  13.77  )
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

On 10/16/23 18:46, Frank Li wrote:
> I3C allow devices early terminate data transfer. So set "actual" to
> indicate how much data get by i3c_priv_xfer.
> 
> Signed-off-by: Frank Li <Frank.Li@nxp.com>
> ---
>   drivers/i3c/master/svc-i3c-master.c | 7 +++++++
>   1 file changed, 7 insertions(+)
> 
> diff --git a/drivers/i3c/master/svc-i3c-master.c b/drivers/i3c/master/svc-i3c-master.c
> index 3570b709cf60..444825aafa6f 100644
> --- a/drivers/i3c/master/svc-i3c-master.c
> +++ b/drivers/i3c/master/svc-i3c-master.c
> @@ -138,6 +138,7 @@ struct svc_i3c_cmd {
>   	const void *out;
>   	unsigned int len;
>   	unsigned int actual_len;
> +	struct i3c_priv_xfer *xfer;
>   	bool continued;
>   };
>   
I'm thinking would it make sense to combine this and previous patch by 
removing the read_len/actual_len variable from this structure and use 
the added one (by the patch 2/5) from "struct i3c_priv_xfer" directly?

-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
