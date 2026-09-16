Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0D28AC982C9
	for <linux-i3c@archiver.kernel.org>; Wed, 16 Sep 2026 18:30:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=2hswsMROK/O69eZl+AQkAiy8qXJpYJ6Ro5crc7m3qtg=; b=HiQhSm3HEvRl5W
	BGxWQlTnyeQaDl0S9ry+5kG+eYBkDx9Jbl8QSUiPLu2Z95nFJ4jQBSphRHk/nJIPedRjwbKHI1GRg
	ER1xnDPQcrN6zjKstyOb1C9ceXeNJMyvx5urD/C+wRYpb2UtVJDeIuwNB6IouJNZn35dbLK2+g01F
	/y/GCLqblB5KRikiqa3WFO+TRgfIme1LiLaVdseg7KSTqgg/ADaFE/yGFexBYCzvIYJ65mYIWhgwI
	zGmEpSWboKy9AWG/y7PSXddiUGSprc8XdcV4pmQz2zV8duOTxJVR+iGqFevOGTmtiFWfdLUHkyT03
	c1IBnYMP0hHDyiYMgGnQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6uP8-00000009xR1-1i0R;
	Wed, 16 Sep 2026 18:30:46 +0000
Received: from linux.microsoft.com ([13.77.154.182])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6uP5-00000009xQT-2Xpl
	for linux-i3c@lists.infradead.org;
	Wed, 16 Sep 2026 18:30:45 +0000
Received: by linux.microsoft.com (Postfix, from userid 1223)
	id DE87520B7169; Wed, 16 Sep 2026 11:29:57 -0700 (PDT)
DKIM-Filter: OpenDKIM Filter v2.11.0 linux.microsoft.com DE87520B7169
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.microsoft.com;
	s=default; t=1789583397;
	bh=66yRjiZbxnq9mprxpNY9s32uLqj5SRsaSVuXRrNPJDo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=jp95ag81bTPAfUxSwAMExx+Vq6XExpCBRqB/a+E59hTqkE1wEIzFPyYcabB2JGi6X
	 m1lOuWIwhz/Xl0v6sxikBQLslMD7uVBiASTSbpbWwxtqVp7WwbbkBzjQcz8Noey/id
	 ZrJSfh6hgBsaqrkZKroU94QqPJ7D0v7khXhi7nLo=
Date: Wed, 16 Sep 2026 11:29:57 -0700
From: Meagan Lloyd <meaganlloyd@linux.microsoft.com>
To: Guenter Roeck <linux@roeck-us.net>
Cc: Meagan Lloyd <meaganlloyd@linux.microsoft.com>,
	linux-i3c@lists.infradead.org, alexandre.belloni@bootlin.com,
	vitor.soares@toradex.com, samagazaryan@google.com,
	gregkh@linuxfoundation.org, arnd@arndb.de,
	boris.brezillon@collabora.com,
	oleksandr.shulzhenko.viktorovych@intel.com,
	tgopinath@linux.microsoft.com, corbet@lwn.net,
	skhan@linuxfoundation.org, Frank.Li@nxp.com,
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
Subject: Re: [PATCH 1/3] i3c: master: enable driver_override for I3C
Message-ID: <20260916-2b134d3050dcbc59b45e40ce@linux.microsoft.com>
References: <20260911210935.1353126-1-meaganlloyd@linux.microsoft.com>
 <20260911210935.1353126-2-meaganlloyd@linux.microsoft.com>
 <342236b8-11f0-44bc-b0f3-2f167a6f521b@roeck-us.net>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <342236b8-11f0-44bc-b0f3-2f167a6f521b@roeck-us.net>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260916_113043_680868_9DAC45AD 
X-CRM114-Status: UNSURE (   6.55  )
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

> Separate patches for each hwmon driver, please. Each patch should use the
> standard prefix used in hwmon drivers.
> 

> Thanks,
> Guenter

Will do, thanks for the feedback.

Best regards,
Meagan


-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
