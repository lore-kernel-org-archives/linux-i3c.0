Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8178CCE8340
	for <linux-i3c@archiver.kernel.org>; Mon, 30 Sep 2024 13:21:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=zShJPEq3eXxrpQvlFwaATwp8yeP7id8SJ0NNTcrbc6s=; b=hNIPPoA2dmIug+
	XQ5sDBpBK6Igl/wJzPp1Oqski8J1YsLaoJPI/Oa1m4W5ctijfyThBAcrjyoCNZ4ARNimFNh8MyO9+
	R4i7eR/7sTf/LeaV2yHC8g+W2KHSG1rmJSy06k0sJyiYDtqeipz/6dYhVIt2bW0PQWNiLfMql/4r6
	HH6Yjnwcr1dKcAt2ncsIOKgeGrLBAKphKsqMDMx5rPm3bhhpvrGTRTDFVhdgWW1WkvvBR0S2jc41A
	Hrzmk6GJWpWD/dEL5M2kw93AW/kibwcbKbJftv06MftoxExGZ0J9qdILUIUb2L4K5W7g2GwkUUpZP
	5s+JbTaB1mfiJtfxl9Qg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1svGKw-0000000HGhU-3CMk;
	Mon, 30 Sep 2024 13:21:14 +0000
Received: from mgamail.intel.com ([198.175.65.10])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1svG3D-0000000HC4y-0az9
	for linux-i3c@lists.infradead.org;
	Mon, 30 Sep 2024 13:02:56 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1727701375; x=1759237375;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=fkxcP//T2bdCrNiiepbSkSNWGrnL8P9uBimRUKy/Y3E=;
  b=ar1RoV1/gja8HLALFxzoTXr+m2CqNSLz1Qkog0Jw7CZ7SsUlazXAcrrq
   oOXiYw5loqyPWbsNGfPYdi/lJ10DGda4Rz+50BbNnTjg33Skq49MxusxP
   tE795oiedAmW8reBx/WJXeoEoqQTteWpUqX5d6QioU21yq2Cieow6fwK2
   /+v5z/hjzIJo7HBhMDjob1QlahjAy1RxXjy1H+DpQqTp7HdFbeee0UX7u
   1lbLCkB4zithmpDalJHH/LEaPbQRgcAAIcHTXJhfkEzky1+lPE+3cKPjf
   QMwJWFoC73TqOApdcPsPurDhADUqqophWu3INC/eCfcLTr8yMISGAM70m
   A==;
X-CSE-ConnectionGUID: R1jdy6ebQTq+Cs+UmEbwYA==
X-CSE-MsgGUID: leTlDE8zQ/e7YziXPCh8bg==
X-IronPort-AV: E=McAfee;i="6700,10204,11210"; a="44249664"
X-IronPort-AV: E=Sophos;i="6.11,165,1725346800"; 
   d="scan'208";a="44249664"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Sep 2024 06:02:49 -0700
X-CSE-ConnectionGUID: IDGE5YPgQRStRbNatNEhYQ==
X-CSE-MsgGUID: txLXHwaCSB27TWZKlrI/3g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,165,1725346800"; 
   d="scan'208";a="104095475"
Received: from mylly.fi.intel.com (HELO [10.237.72.151]) ([10.237.72.151])
  by orviesa002.jf.intel.com with ESMTP; 30 Sep 2024 06:02:48 -0700
Message-ID: <d0de10c7-bd99-4b81-aa11-5039c514eefc@linux.intel.com>
Date: Mon, 30 Sep 2024 16:02:46 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: TODO : i3c/master/mipi-i3c-hci/dma.c
To: cvam <cvam0000@gmail.com>, alexandre.belloni@bootlin.com
Cc: linux-i3c@lists.infradead.org, linux-kernel@vger.kernel.org,
 Shuah Khan <skhan@linuxfoundation.org>
References: <CADVSkwnC6b3irLx58YRGJayw09AvVUqmN=3_b35vdhJKFpsgog@mail.gmail.com>
Content-Language: en-US
From: Jarkko Nikula <jarkko.nikula@linux.intel.com>
In-Reply-To: <CADVSkwnC6b3irLx58YRGJayw09AvVUqmN=3_b35vdhJKFpsgog@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240930_060255_268558_DC20B118 
X-CRM114-Status: UNSURE (   9.38  )
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

On 9/28/24 9:39 PM, cvam wrote:
> Hello Alexandre
> 
> This mail is regarding TODO present in the i3c/master/mipi-i3c-hci/dma.c, i
> would like to work on it, please give some more info what exactly we are
> referring here.
> 
> 
>                                  dev_err(&hci->master.dev,
>                                          "response tid=%d when expecting
> %d\n",
>                                          tid, xfer->cmd_tid);
>                                  /* TODO: do something about it? */
>                          }
>                          if (xfer->completion)
>                                  complete(xfer->completion);
> 
Well source code has minimum handling for unexpected but uncertain what 
to do about it. In my opinion "TODO" is a fair comment about it.

I'd leave it as it until somebody sees it on real and then we can debug 
does it need some steps in HW/SW point of view to recover.

-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
