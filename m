Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9BBD0D65C57
	for <linux-i3c@archiver.kernel.org>; Thu, 14 Nov 2024 08:00:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=2sD2CfbNZ2aPKrNoGe4QogcRvyQZQrkViyAlomSDk1Q=; b=SOtewx9+N17USp
	y4T2vwPk7IOm07y1jIt+GqkzyJJQeXM7lmicrQRYLW+JTpdR7amZq3U8Njq+XqBBsHOikkh9S+r+k
	9wTWb5nmhzZuY/02l8sloHVY8gL7AAMqPqC7F9mNuSYXQl2XcE61NQ2QniIXoe9O+C/sTab0KK5hy
	7kICSG9zPgfLiewNlIccVMjvxsjBT5EjY+aVMgLMdgfg0vVJZhUmPo+NQQh33X+XpcLllacfLLNnY
	aoFMkDZe3Mc4drUfvblIXis/ooosYCpf/QQZEmy1t4hoLpE5VCumJiNkSXGOFZnqBuQkOW8ipe2Di
	weCpE7Nv6ZgT/LTQ3B5g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tBUmh-000000099TB-1WsA;
	Thu, 14 Nov 2024 08:00:59 +0000
Received: from mgamail.intel.com ([198.175.65.14])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tBUme-000000099Sd-3xhH
	for linux-i3c@lists.infradead.org;
	Thu, 14 Nov 2024 08:00:58 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1731571256; x=1763107256;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=da4pBsK4DBhIwCdc93CYocbC+ItcYg4K13DNt5dXyCg=;
  b=Pjzss4Z3h5/6hmDPpO3ud0b0zFZpo1A7JdOHkqkXvNYVRNbwmSVYoXZv
   tus1RShvFwMzvhQYmmH6u/BpxySX1RhfLwnLUJA5MsB4UJVnbihF7Zca2
   DGO1J+za3i9Rb1aIsOYHnh0JXBUhweQHrprdnKJJompVkQkXU9+U0Deyf
   x+EgK3HUr9p6INoaremr1DL0p7oYwGanftQDDkzM1303p7ivN4/cygYUu
   s2komKKCUnsBqJDwB5aotbrA7bnj2ZFSspotW9Kvpxc60n6bmeoY0+R6w
   582g8DD6boFyKUyvb5RYM/8/UfWp3P+UxiVuSAx+dxJIKTlslP0SHBb3t
   A==;
X-CSE-ConnectionGUID: qmU1O0ENTG6+Q8ukIi+ftQ==
X-CSE-MsgGUID: X/ZMGyO7Si6zTbJeOVNv0A==
X-IronPort-AV: E=McAfee;i="6700,10204,11255"; a="35290933"
X-IronPort-AV: E=Sophos;i="6.12,153,1728975600"; 
   d="scan'208";a="35290933"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Nov 2024 00:00:56 -0800
X-CSE-ConnectionGUID: y9Fj111VQ5ahIXsLyg258g==
X-CSE-MsgGUID: haOo8p+MRSCT+ytWq5K/+w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,153,1728975600"; 
   d="scan'208";a="118942637"
Received: from unknown (HELO [10.237.72.151]) ([10.237.72.151])
  by orviesa002.jf.intel.com with ESMTP; 14 Nov 2024 00:00:55 -0800
Message-ID: <6ebcd448-e0c8-4b31-950c-4c73961be758@linux.intel.com>
Date: Thu, 14 Nov 2024 10:00:54 +0200
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
X-CRM114-CacheID: sfid-20241114_000057_065964_87387816 
X-CRM114-Status: UNSURE (   6.87  )
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
> Add AMDI0015 _HID for Designware I3C driver so that the dw-i3c-master
> driver can be probed on AMD platforms.
> 
> Signed-off-by: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
> ---
>   drivers/i3c/master/dw-i3c-master.c | 7 +++++++
>   1 file changed, 7 insertions(+)
> 
Reviewed-by: Jarkko Nikula <jarkko.nikula@linux.intel.com>

-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
