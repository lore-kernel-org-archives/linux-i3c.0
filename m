Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 94C1BC44520
	for <linux-i3c@archiver.kernel.org>; Mon, 20 Jul 2026 17:10:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=+H7OwCUdApJrpVRvfITHBMPai2U7QKwvyeUzuaSYlSE=; b=gsJ9/1LGkbcLac
	ZdRqdc4rJB3jfghL5CE92XeJ4kyFPk+mXTqKOTY4Nfe0vlG2cxKA7lNCAvJP1GRGBD2OtGt+INRby
	ErOrcr1uxRPBbOHGeia29Gl0h+K7qyVrX+wSwHcp3eg7ILbBrHfF6oZspuZM5X8/hIMY/4jNk63FQ
	MMxOaxLP/PK2zpWqji231Xqph3/1DP963/z1zB0o/uaESEEG77ufrxqlwANveMqWvThy2glDOj5g5
	TzOyETbofLpdHD+ZiHs4f5CIgpkVor7Hn3ZhPmH4W4JxT0lmWEp8YYoafEMUB5RRcNygcpq0EEjVr
	kd1zc6Hi9nUvxDUhlUOg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wlrVX-00000007U0F-0vyj;
	Mon, 20 Jul 2026 17:10:23 +0000
Received: from smtpout-02.galae.net ([185.246.84.56])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wlrVU-00000007Tz7-0IlJ
	for linux-i3c@lists.infradead.org;
	Mon, 20 Jul 2026 17:10:22 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id B812F1A10FF;
	Mon, 20 Jul 2026 17:10:17 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 8C15760360;
	Mon, 20 Jul 2026 17:10:17 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id A7D1211BD0382;
	Mon, 20 Jul 2026 19:10:15 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1784567416; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 in-reply-to:references; bh=QvUHF9fl6x0NnyzgRQM5iDkaGboTMjtA2Xhi7B6JVuQ=;
	b=i52LgIET6QdPDSKvqgOHN4iWAnUkEOqVz0X986FfUrrbU7dbsUwGPHIsPyAwNFhSo/GYpb
	tOejquCvArGNIeNq+0kNe/m0AYNci/2Bh4aB116IZLtRLxb+zNcbec0ECMAfD0tEjFwLxw
	8IbxAe3I0H4hLQryF1VAPPO+RXfSceLEaWB0qxRyHOCSbW+zHn898/UemDX30XQfqpZQWM
	dheiPgR/b8vJQEHu50rfcDwhCP8m3Uhd5buT9a41ixJyEcEvmdOfgcecQIoFVfYjfvNSMK
	4qitxd9P3LNV5bABcWb6hRoRgcVqoj7VLwCZ07M9k+jx5G408ykcLbUR9SGxNQ==
Date: Mon, 20 Jul 2026 19:10:14 +0200
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: jorge.marques@analog.com, Frank.Li@nxp.com,
	Can Peng <pengcan@kylinos.cn>
Cc: linux-i3c@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] i3c: master: adi: add OF module alias for autoloading
Message-ID: <178456740837.100432.12678908203961675730.b4-ty@b4>
References: <20260715012949.180245-1-pengcan@kylinos.cn>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260715012949.180245-1-pengcan@kylinos.cn>
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260720_101020_252897_07274505 
X-CRM114-Status: UNSURE (   6.51  )
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

On Wed, 15 Jul 2026 09:29:49 +0800, Can Peng wrote:
> The Analog Devices I3C master driver can be built as a module and uses
> adi_i3c_master_of_match as its OF match table, but the table is not
> exported for module alias generation.
> 
> Add the MODULE_DEVICE_TABLE(of, ...) entry so modpost can generate OF
> module aliases for OF based module autoloading.
> 
> [...]

Applied, thanks!

[1/1] i3c: master: adi: add OF module alias for autoloading
      https://git.kernel.org/i3c/c/0043b9bb5806

Best regards,

-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
