Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 493C0D65C58
	for <linux-i3c@archiver.kernel.org>; Thu, 14 Nov 2024 08:00:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ECdGEMw/RIF4FZlUuTLR/G2VoC8rw2Wfmv+MGQFgK+0=; b=e35yNCWMkAO5wS
	VR/sJvVs2PwBbVQcWqTvmN6eX5nFvl5/sJHs03H9LUaoHd3P5LJ6BAYhqLW8m1sdRzAlpMipDgvHu
	Ol0BRqYnkwIMl6BY8BlyjimlYSMLxBi5qy54iqMVie/r4SH7EFEGrQTDIdMTt97v4mMrz2bB4a2b9
	IHOxnIiyNqXUmLtTCyPH5oBQTbIdlBQ0JUpW1OfVgiFM2teUQtfSBiChoseX/aa4do6TgHRSkuuf6
	v0z0TJly4Q167ejlmNEZo16J+py2V1uE3k+l9kciLZERIfJpUzyx92Q196ZHIf27QHbXgmm3QEEAf
	JFlpSQtN6jt4360Jt+ZQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tBUm8-000000099NG-45nh;
	Thu, 14 Nov 2024 08:00:24 +0000
Received: from mgamail.intel.com ([198.175.65.14])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tBUm5-000000099Mp-3vB5
	for linux-i3c@lists.infradead.org;
	Thu, 14 Nov 2024 08:00:23 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1731571221; x=1763107221;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=pyJ67CP7rBFGXzeAdWnMM/ARk3xiWgaToDtifWrU47g=;
  b=gkFJJccNtgSApemopr3RtZk2cD5GZ9VxdwlrGfvFo6bNetgQHelA3j7S
   AcHU/Be0i3BUS8t8x2TfjZ9CF5HO4opCm2wO5Fq7iwYJqOZYBWqxIxjCf
   fbFzNTFzWDg0uUcG0jhqbkW8gXzrqdBbnG9xp0PYhaUkdBQ/gfr+lwC6b
   aIOY8RebDHU2Nm9BxFk6JbqqNczlD5LeodfljoQ02InbDLRTrLeDd6CIh
   KTQyXmCey2KfSLy51Ilig8KBnpU/q/g+uCWIz77EGg5IlEkGD0BvGQpaJ
   lHYm53989OznRL4z5AlC30oVGOkkgaPgtWCIY3ooTC9ZWcaBY6HJu+ggB
   Q==;
X-CSE-ConnectionGUID: WIPi5bv6QC214ibv1n+zDg==
X-CSE-MsgGUID: 9NFx5TdkRFiwkxENI9Pvww==
X-IronPort-AV: E=McAfee;i="6700,10204,11255"; a="35290889"
X-IronPort-AV: E=Sophos;i="6.12,153,1728975600"; 
   d="scan'208";a="35290889"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Nov 2024 00:00:21 -0800
X-CSE-ConnectionGUID: QJPrDpFbTgCDzVauE6MRxw==
X-CSE-MsgGUID: yxtGgvJWT1G9Sp4fPGsyEg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,153,1728975600"; 
   d="scan'208";a="118942327"
Received: from unknown (HELO [10.237.72.151]) ([10.237.72.151])
  by orviesa002.jf.intel.com with ESMTP; 14 Nov 2024 00:00:20 -0800
Message-ID: <bec1b482-66f8-480d-bb01-31697c5e953f@linux.intel.com>
Date: Thu, 14 Nov 2024 10:00:18 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 2/5] i3c: master: Add ACPI support to i3c subsystem
To: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>,
 Heikki Krogerus <heikki.krogerus@linux.intel.com>
Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Sanket.Goswami@amd.com, linux-i3c@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-acpi@vger.kernel.org
References: <20241108073323.523805-1-Shyam-sundar.S-k@amd.com>
 <20241108073323.523805-3-Shyam-sundar.S-k@amd.com>
 <ZzS1-nJMPiCp5jDi@kuha.fi.intel.com>
 <079db1b6-0f95-452e-832b-7d392e130028@amd.com>
Content-Language: en-US
From: Jarkko Nikula <jarkko.nikula@linux.intel.com>
In-Reply-To: <079db1b6-0f95-452e-832b-7d392e130028@amd.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241114_000022_061321_2FAFAC90 
X-CRM114-Status: UNSURE (   5.46  )
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

On 11/14/24 6:33 AM, Shyam Sundar S K wrote:
> Jarkko, will you be able to pick 1/5 and 5/5 without a separate series
> or do you want me to send one?
> 
I let Alexandre answer to that since he's the I3C subsystem maintainer. 
Some maintainers prefer a new set and others may pick individual patches.

I'll give anyway my reviewed by tags to those two patches.

-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
