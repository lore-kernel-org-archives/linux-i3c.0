Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 38ACCD49222
	for <linux-i3c@archiver.kernel.org>; Mon, 18 Nov 2024 13:37:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=v6BlHZB5eHchuY1HuZkRLV6qsBTJO5GRxTW5toK8qwI=; b=B7jZZInzJjM9qJ
	/s1vmkuid6k16EgiB2IeZixskaxd7G7nQfmcIJ8p4aUJ5KYJTbh7s5q8NM9o2Sp4RpVYuZLmAYxaT
	C4puJTxnL6KjlmdZ28dnBlT+T9+W4mtEDUm2fVChYj1aSfaNU58AcG9dyHOHH4ci3NEWnyGoCvPvL
	mAMmXmsqSpWdfRghYmpEehLzoA/HNHzwv7u6KCAzLxinZw9PbGxy/iFbs3m8RA/DwZmhHQ7yGDJzy
	/ywIAIqHY1fX1yLcItVMWCFIkaTdu9RlWXJp2aDi3vDi7vqK93460kG4ulTu9jh7fZdl9Z1OZQNA1
	kf93xR5TVw/Wlxf4gomg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tD1w7-00000009c12-3zyO;
	Mon, 18 Nov 2024 13:37:03 +0000
Received: from relay8-d.mail.gandi.net ([217.70.183.201])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tD1pq-00000009aDe-3Htp
	for linux-i3c@lists.infradead.org;
	Mon, 18 Nov 2024 13:30:36 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 55AA51BF203;
	Mon, 18 Nov 2024 13:30:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1731936632;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=S3YSdUFKKvYQVZsA4uIFZEUQhKLwa3K8Neu9RSQ63cU=;
	b=kBECa0Z/TB7lLcpOPhc73KVOs/3/BXZX2w48v0lSNYFeI+e0qb37l6VHen1qy0GALus23Q
	N+DwHlqxjtBCiBKujBCU2RReez1dwhzU1hyCHxpCZkXhTl9GoiX8DzXkUAEvrwAhj9XLHv
	d+msTZdFrRX6pmZJjI0tvgNJUMHKcoS6MjjHxx7AcHAFH5fl9On5ShM21+VBkyLsWtNOfI
	bg/bNC6LVFoJ+4ELmhXLSnyCWN0/ECScBivrMQ7q7JyXur8nMNrv4dBnhsXEKlOC6rHbjq
	Z45V5qGWj06XpiSf8OLXmN4upp13zqyXaYig1c44ZJl7k3bLZOjBLTLZ9SwdZg==
Date: Mon, 18 Nov 2024 14:30:31 +0100
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: Jarkko Nikula <jarkko.nikula@linux.intel.com>,
	Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
Cc: Sanket.Goswami@amd.com, linux-i3c@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 0/2] Introduce initial support for the AMD I3C
 (non-HCI) to DW driver
Message-ID: <173193659469.36588.225755513735675648.b4-ty@bootlin.com>
References: <20241114110239.660551-1-Shyam-sundar.S-k@amd.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20241114110239.660551-1-Shyam-sundar.S-k@amd.com>
X-GND-Sasl: alexandre.belloni@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241118_053034_948955_B99A7E00 
X-CRM114-Status: UNSURE (   9.06  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-i3c" <linux-i3c-bounces@lists.infradead.org>
Errors-To: linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org

On Thu, 14 Nov 2024 16:32:37 +0530, Shyam Sundar S K wrote:
> In this series, support for following features has been added.
> - Add dw-i3c-master driver with ACPI bindings
> - Workaround for AMD hardware
> 
> v4:
> ----
>  - Split the series into two
>  - add Jarkko tags
> 
> [...]

Applied, thanks!

[1/2] i3c: dw: Add support for AMDI0015 ACPI ID
      https://git.kernel.org/abelloni/c/0a0d851ce1bc
[2/2] i3c: dw: Add quirk to address OD/PP timing issue on AMD platform
      https://git.kernel.org/abelloni/c/473d0cb48587

Best regards,

-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
