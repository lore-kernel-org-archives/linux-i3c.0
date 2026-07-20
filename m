Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2876FC44520
	for <linux-i3c@archiver.kernel.org>; Mon, 20 Jul 2026 16:51:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=L0CqCirzs8ahEcPWoiXOf3e4i+2ZOciHoLhB13Du/FI=; b=RkXawfwB4BpHMa
	R9ZzqymWcp0qoDh5EUHRG9zW4foCB6lci1JHYoqFyXUuk1zGoP9O3/c7+5zi+DJfhUBQvL2JvtHS+
	tuLqzZ3gD+YWCtmwIz2AqszEUCqEkD4ZCS1u3QXNL1pK/hsB9bCCuEzxD9rbtPWhSo3etraH44slj
	cqMeCAN6J/VKcJxhdzITAsoqQOA1FuP9BUT3nlEn3WYidGsMFukEgUXbTvcZIiY3V09eNgDXLzib0
	NKtODosofMMdYcD4+MLtlrX4D1LoMKomE2ArfBtOiVytoP9DWXH3sUnfBcILYazlkH6w7rZO+UdFZ
	sJ/s6L1bxjIzKxcmVnaQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wlrCo-00000007R89-33J7;
	Mon, 20 Jul 2026 16:51:02 +0000
Received: from smtpout-03.galae.net ([185.246.85.4])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wlrCl-00000007R7Q-1fF8
	for linux-i3c@lists.infradead.org;
	Mon, 20 Jul 2026 16:51:01 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 88FC64E40E75;
	Mon, 20 Jul 2026 16:50:56 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 50A6260360;
	Mon, 20 Jul 2026 16:50:56 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 5208E11BD0382;
	Mon, 20 Jul 2026 18:50:48 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1784566254; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 in-reply-to:references; bh=sjX+9x0hottSvvIBjAOtiqc812VcJKoGeEL9Lkzb2Wc=;
	b=Wr4Rr3r/gj7+03fa3rdg1Ic99q24vYMoan6WwJP/OjkbaywQwGDpFG7KlkAq0LIjgCflnU
	6OSOnKiFYG1DKm19zddJi9qOCG+n+RLcnezgOxElqTHLgSM7axBI81NaZc/LF97aE9KliK
	D2Ok0qr1JD7GxegCq6sBRzA3VcO5CdDHOfpWOkTI3kZNPobNV8413+VynOdiAjW+cdRodw
	ZGFVMN9I9IbOjEJ+O7X0848yjtI9zJErNqo5qOK+x2auQHRlGe7zls6iqGxYmKJTMT58tC
	f9M/NGIOz99bd13Gjo/nqEn1oyZFeIh4SSSXoMEPaTJCgjhY8ccynvXcgat2AA==
Date: Mon, 20 Jul 2026 18:50:47 +0200
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: git@amd.com, michal.simek@amd.com, Frank.Li@nxp.com, robh@kernel.org,
	krzk+dt@kernel.org, conor+dt@kernel.org, pgaj@cadence.com,
	wsa+renesas@sang-engineering.com, tommaso.merciai.xr@bp.renesas.com,
	arnd@arndb.de, quic_msavaliy@quicinc.com, Shyam-sundar.S-k@amd.com,
	sakari.ailus@linux.intel.com, billy_tsai@aspeedtech.com,
	kees@kernel.org, gustavoars@kernel.org,
	jarkko.nikula@linux.intel.com, jorge.marques@analog.com,
	linux-i3c@lists.infradead.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arch@vger.kernel.org,
	linux-hardening@vger.kernel.org,
	Shubham Patil <shubhamsanjay.patil@amd.com>
Cc: radhey.shyam.pandey@amd.com, srinivas.goud@amd.com,
	shubhrajyoti.datta@amd.com
Subject: Re: [PATCH v10 0/2] Add AMD I3C master controller driver and bindings
Message-ID: <178456622175.94414.3329397906722546895.b4-ty@b4>
References: <20260709064233.1451482-1-shubhamsanjay.patil@amd.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260709064233.1451482-1-shubhamsanjay.patil@amd.com>
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260720_095059_573543_5E08427F 
X-CRM114-Status: UNSURE (   6.09  )
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

On Thu, 09 Jul 2026 12:12:31 +0530, Shubham Patil wrote:
> This patch series introduces support for the AMD I3C master controller,
> including the device tree binding and driver implementation.

Applied, thanks!

[1/2] dt-bindings: i3c: Add AMD I3C master controller support
      https://git.kernel.org/i3c/c/56cffc20a329
[2/2] i3c: master: Add driver for AMD AXI I3C master controller
      https://git.kernel.org/i3c/c/7e05871da7ac

Best regards,

-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
