Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 17223C52D7C
	for <linux-i3c@archiver.kernel.org>; Fri, 23 Aug 2024 10:13:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=iczfg4dolpx1yu1vXmQ7nLznkVxKxoE830LDcjUbXx8=; b=aChpWS45N79Hmd
	cgEAE0AeNP7Xnzi7cTWY259RfY2080c8l6Q9LBKULotnIGaI4IDThjR5MotCd/FzM0iNJQoDCW6eE
	tN2uA2dsMGYcRidPy+lSOMD0HkhlJWSRe39KaZ1vBJUVhJXAaM6qmqezukUDtLz2bOeexuoxxshVN
	2APu3OmEuW5ia80rqVnuyKDYiTX9plI6h3xb6aMm+J9zOvmiPXkNXYgcPd+G8Gy4sPfKOF0MUItfo
	542V12qAUlYUhNWyoNRNuTuUTTTZ6qm8Dj+7DH1I56x1ogqOzeQQbo8USp/A9HlEZLqxLWJ64EoKx
	YFlfGqmpXxe8w+kIc6kw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1shRIk-0000000GH4Q-2OQn;
	Fri, 23 Aug 2024 10:13:50 +0000
Received: from mgamail.intel.com ([192.198.163.16])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1shRIh-0000000GH3D-30Ly
	for linux-i3c@lists.infradead.org;
	Fri, 23 Aug 2024 10:13:48 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1724408027; x=1755944027;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=kwZWXCCJPaCGeMaKS+UIFXgZpykCQVIrE/gdE6I9zBs=;
  b=cz1QJ9wUMO+mXMMdaE30vORBdvV1m/RhcUUDEwuQO8hm7juT8viW+FWV
   k9FBkOvZH2YDsZAcK4a4yhZ3n+lDJdsBrvhDRwSZUza3Gy76Yz3IkFV9o
   pJAf2b+7z/wAkPYqhmJ5YITp0IUnIY7fCYYjDOuz2XAy8YdtXgaWqODN6
   gehCdi8B2h5FVJhjNNPLBl4YXIfADLw15TBS7Y3nNi1Xpq4idc9WKLbtJ
   a3NBvMMm/lQthHmjv3tgQLNqWXb3axMmrZ3TZlt37CEXRzn7fhpal+p6G
   Ic/WFnJFOrlvw4C3GD4Nr9ay+TxN0Cq4YRiAiylD7qRY8NSeSrEudkqHR
   g==;
X-CSE-ConnectionGUID: qszlvU+ySPm50IdgqbZ94w==
X-CSE-MsgGUID: FFiptXcQQdatATxe+vN34g==
X-IronPort-AV: E=McAfee;i="6700,10204,11172"; a="13167760"
X-IronPort-AV: E=Sophos;i="6.10,170,1719903600"; 
   d="scan'208";a="13167760"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Aug 2024 03:13:47 -0700
X-CSE-ConnectionGUID: 1/mEJVR5TOKsiLPNedotmw==
X-CSE-MsgGUID: +Hqgk3NWRPWU33pEWC81OA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,170,1719903600"; 
   d="scan'208";a="61902924"
Received: from mylly.fi.intel.com (HELO [10.237.72.154]) ([10.237.72.154])
  by fmviesa010.fm.intel.com with ESMTP; 23 Aug 2024 03:13:45 -0700
Message-ID: <34e8083e-1439-442d-a979-03ac5b65ae38@linux.intel.com>
Date: Fri, 23 Aug 2024 13:13:43 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 6/6] i3c: mipi-i3c-hci: Add a quirk to set Response
 buffer threshold
To: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc: Guruvendra Punugupati <Guruvendra.Punugupati@amd.com>,
 Krishnamoorthi M <krishnamoorthi.m@amd.com>, linux-i3c@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <20240821133554.391937-1-Shyam-sundar.S-k@amd.com>
 <20240821133554.391937-7-Shyam-sundar.S-k@amd.com>
Content-Language: en-US
From: Jarkko Nikula <jarkko.nikula@linux.intel.com>
In-Reply-To: <20240821133554.391937-7-Shyam-sundar.S-k@amd.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240823_031347_802357_51D41B49 
X-CRM114-Status: UNSURE (   9.31  )
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

On 8/21/24 4:35 PM, Shyam Sundar S K wrote:
> The current driver sets the response buffer threshold value to 1
> (N+1, 2 DWORDS) in the QUEUE THRESHOLD register. However, the AMD
> I3C controller only generates interrupts when the response buffer
> threshold value is set to 0 (1 DWORD).
> 
> Therefore, a quirk is added to set the response buffer threshold value
> to 0.
> 
> Co-developed-by: Krishnamoorthi M <krishnamoorthi.m@amd.com>
> Signed-off-by: Krishnamoorthi M <krishnamoorthi.m@amd.com>
> Co-developed-by: Guruvendra Punugupati <Guruvendra.Punugupati@amd.com>
> Signed-off-by: Guruvendra Punugupati <Guruvendra.Punugupati@amd.com>
> Signed-off-by: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
> ---
>   drivers/i3c/master/mipi-i3c-hci/core.c       |  6 +++++-
>   drivers/i3c/master/mipi-i3c-hci/hci.h        |  2 ++
>   drivers/i3c/master/mipi-i3c-hci/hci_quirks.c | 11 +++++++++++
>   3 files changed, 18 insertions(+), 1 deletion(-)
> 
Reviewed-by: Jarkko Nikula <jarkko.nikula@linux.intel.com>

-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
