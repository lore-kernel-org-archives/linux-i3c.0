Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DDE8BC982C9
	for <linux-i3c@archiver.kernel.org>; Wed, 16 Sep 2026 18:38:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=dLXVrLb0l8lqgoYlsn/1E2QqXhMXx5yYdihiQpICpSA=; b=oG89Nli4SYm7F+
	nzEgmBIF4qjdaZ/QoKmPPDNjQgNPNStLhgH+urhHYXimKMuQGxFP89lDLsoNOjeUMxzuXVN2p7kTZ
	Cab24lXLLDlTta6MoHKWOV5G5yCjxzFFLj+O8I7bS9ZumrTVjAMzZqS7bBFECC1LyOZ4AAryyJWw/
	MX8kz7dCdjx36fUqdhpcnzognqFJtNPhoe2FsbPAVsyK0+EPbglLCwgeghyUyOyAwxwk7ZhdFbBqy
	ab6WFR5JGY4lAldUxyez355AHwroffAABkPajCbezqbSVj+EG3yMvGvHFQ4a3T4PTu4XtNqsKYaxq
	WG9vFlLAatv8Dmurtm2A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6uWi-00000009yEk-2Mxe;
	Wed, 16 Sep 2026 18:38:36 +0000
Received: from linux.microsoft.com ([13.77.154.182])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6uWg-00000009yE5-1tLF
	for linux-i3c@lists.infradead.org;
	Wed, 16 Sep 2026 18:38:35 +0000
Received: by linux.microsoft.com (Postfix, from userid 1223)
	id 1CEC920B7169; Wed, 16 Sep 2026 11:37:49 -0700 (PDT)
DKIM-Filter: OpenDKIM Filter v2.11.0 linux.microsoft.com 1CEC920B7169
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.microsoft.com;
	s=default; t=1789583869;
	bh=9wZWN3c7VtfU90nlylRqOxhet8YTp7k1kim88XV1ips=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=rfvyhs86B1WHn0HXBT2/McElIEdN6Md26yOwXBHT06v6u7v4r6/Saj0sxJHRis2yS
	 mGIVyLRBWCrUYRtKfaw0bwXCSYo4X3clSVvu4cjWoPtEFsjc/yCljS/i+9m+t2hNym
	 Uwy3mV8kPJ1dQ+74YMB7IQwZpHEQgNCeLfPkYbcM=
Date: Wed, 16 Sep 2026 11:37:49 -0700
From: Meagan Lloyd <meaganlloyd@linux.microsoft.com>
To: Randy Dunlap <rdunlap@infradead.org>
Cc: Meagan Lloyd <meaganlloyd@linux.microsoft.com>,
	linux-i3c@lists.infradead.org, alexandre.belloni@bootlin.com,
	vitor.soares@toradex.com, samagazaryan@google.com,
	gregkh@linuxfoundation.org, arnd@arndb.de,
	boris.brezillon@collabora.com,
	oleksandr.shulzhenko.viktorovych@intel.com,
	tgopinath@linux.microsoft.com, corbet@lwn.net,
	skhan@linuxfoundation.org, linux@roeck-us.net, Frank.Li@nxp.com,
	jorge.marques@analog.com, pgaj@cadence.com,
	wsa+renesas@sang-engineering.com, tommaso.merciai.xr@bp.renesas.com,
	nuno.sa@analog.com, Michael.Hennerich@analog.com, jic23@kernel.org,
	dlechner@baylibre.com, andy@kernel.org, lorenzo@kernel.org,
	enelsonmoore@gmail.com, rppt@kernel.org, pratyush@kernel.org,
	giovanni.cabiddu@intel.com, gabewhigham@gmail.com,
	haren@linux.ibm.com, pasha.tatashin@soleen.com,
	jirislaby@kernel.org, adrian.ho.yin.ng@altera.com,
	ustc.gu@gmail.com, jszhang@kernel.org, adrian.hunter@intel.com,
	akhilrajeev@nvidia.com, tze.yee.ng@altera.com,
	manikanta.guntupalli@amd.com, shubhrajyoti.datta@amd.com,
	jarkko.nikula@linux.intel.com, linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-hwmon@vger.kernel.org,
	linux@analog.com, linux-iio@vger.kernel.org
Subject: Re: [PATCH 3/3] i3c: add i3cdev character device module for
 user-space access
Message-ID: <20260916-6e1c9c4182821362eb097551@linux.microsoft.com>
References: <20260911210935.1353126-1-meaganlloyd@linux.microsoft.com>
 <20260911210935.1353126-4-meaganlloyd@linux.microsoft.com>
 <5cd22376-6921-4a2b-acba-371bcbbfa00f@infradead.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <5cd22376-6921-4a2b-acba-371bcbbfa00f@infradead.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260916_113834_516805_F9B6D32F 
X-CRM114-Status: UNSURE (   8.86  )
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

> > +	close(fd);
> > \ No newline at end of file
> 
> Fix the warning above, please.
> Also:
> Documentation/userspace-api/i3c/i3cdev.rst: WARNING: document isn't included in any toctree [toc.not_included]
> 
> add that file to the table of contents (somewhere).
> 
> thanks.
> -- 
> ~Randy

Thanks for catching that! I'll add the newline at the end of the file as
well as add this page to the table of contents.

Best regards,
Meagan


-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
