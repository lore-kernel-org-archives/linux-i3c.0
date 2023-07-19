Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EF590EB64DA
	for <linux-i3c@archiver.kernel.org>; Wed, 19 Jul 2023 05:51:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=SaLTKu1v5c4gQhlwbcTik8wBzPn6IupEyyx6wxQ9YE8=; b=dv4REjvPrrsnel
	EAv8402E/xuC1M0tumPKrq3T/wk5spxzX35s7miRfkeJigQatXY40FUvZ0eJr5U2MJWO5aKdO9wkj
	aN1ihowb7J0OieftucexxkI3OeVd76FYxzO8Ae5AiBCYyFiu2KeFnXp8X/xoqrhTAqwA0YrWw92vR
	GY0316X4FM7LasYJPBDtKLrq8G37rGxGGZ4VxLyYgm51CUVRdLgAlGCee/mDALgvee4Z7zuZrfux+
	YwSq15oO46OI6O6MB9r6KKsulb6Ns+tpjJDktewcBwihxiRNZ58c9NW9WVyf4iB13k1mz9+jDjQFs
	awdxFvu0od6jaruDMJkg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qM069-005RJK-0Z;
	Wed, 19 Jul 2023 05:51:41 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qM067-005RIy-2E
	for linux-i3c@bombadil.infradead.org;
	Wed, 19 Jul 2023 05:51:39 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:From:Date:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=3E6PKrZgW+SQaqGsDrMl+yFPeqLqfI7fvD/atOVDkvE=; b=C75LGn9qWpFAtUfvTIMhVMQBTS
	/6xMW0HQLA6dK6GPNP9poEVjqSiRVQQzVU5ZyB1bId1H7ZBwtuUnEDm6u0pu4PB5i7cZmYiwuO4FA
	tXNkb51EB5u06I0qQJfikNPKQ5lX78nAFgUeEHQsHejdJhPDurwNrY39X5LcIIfN9ahl+XIWa2kyy
	BsdRz77/hLYDMRdwXG+r3oywr2eKD0PjdERwlEQEoGMzjhaI+oB59HSMOGLGRBp7koRecL4qxu2Mi
	KWtT5XdvLWAJUOeuUm0+6EObjYBJRfBxqwbxZNZ1GU0isr9SODkeNysvqgv0XEQg0ovDgiws48+Ge
	IglstEqQ==;
Received: from dfw.source.kernel.org ([139.178.84.217])
	by desiato.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qLwOr-00CQKn-0m
	for linux-i3c@lists.infradead.org;
	Wed, 19 Jul 2023 01:54:47 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id B1094615D5;
	Wed, 19 Jul 2023 01:54:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AFAA9C433C9;
	Wed, 19 Jul 2023 01:54:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1689731681;
	bh=8sE14OUhtH4JOmQnCC2xfg2OxZeca1/kLCPdJ09/ejU=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=ggTEOfCOol+PJCMwddN+Ggr/ke8bz3Gr5H/6HfDliS4zQXi3QgKRAtqtRl+XmmEPq
	 HsGpj0wMzoEoN1rfR2Z352UgOwRmM/mwM2QD2OPk7FJ0MOoBMzEFDv7cOvtBEpkRr/
	 Ar733fq1bL6FAEUfDqGvlRlh+msgjqMjzpKmeZhx0u0/ehaen9IDv0k0r0kcAFBMuV
	 CuMnDcsRnjsl6QRS+2x7ZI0eDLgom3NVVbOciRQ907WA+Prmkw39BIJI3RXHx/b5LD
	 s8CNKiFM2uaHXpB/SbxrrO5YWjunPkq8t3oE3N+nAnmNlRt6YAUGJF+83JbcdgLx0Z
	 V5wKeEb1iYg0w==
Date: Tue, 18 Jul 2023 18:54:39 -0700
From: Jakub Kicinski <kuba@kernel.org>
To: Matt Johnston <matt@codeconstruct.com.au>
Cc: linux-i3c@lists.infradead.org, netdev@vger.kernel.org,
 devicetree@vger.kernel.org, "David S. Miller" <davem@davemloft.net>, Paolo
 Abeni <pabeni@redhat.com>, Jeremy Kerr <jk@codeconstruct.com.au>, Alexandre
 Belloni <alexandre.belloni@bootlin.com>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley
 <conor+dt@kernel.org>
Subject: Re: [PATCH net-next v2 3/3] mctp i3c: MCTP I3C driver
Message-ID: <20230718185439.05304395@kernel.org>
In-Reply-To: <20230717040638.1292536-4-matt@codeconstruct.com.au>
References: <20230717040638.1292536-1-matt@codeconstruct.com.au>
	<20230717040638.1292536-4-matt@codeconstruct.com.au>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230719_025445_664371_975576E1 
X-CRM114-Status: UNSURE (   9.47  )
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

On Mon, 17 Jul 2023 12:06:38 +0800 Matt Johnston wrote:
> +	dev_net_set(ndev, current->nsproxy->net_ns);

This is a bit odd, we may have missed similar code in earlier mctp
drivers. Are you actually making use of auto-assigning netns?

> +	mbus->tx_thread = kthread_create(mctp_i3c_tx_thread, mbus,
> +					 "%s/tx", ndev->name);
> +	if (IS_ERR(mbus->tx_thread)) {
> +		dev_warn(&ndev->dev, "Error creating thread: %pe\n",
> +			mbus->tx_thread);
> +		rc = PTR_ERR(mbus->tx_thread);
> +		mbus->tx_thread = NULL;
> +		goto err;
> +	}
> +	wake_up_process(mbus->tx_thread);

kthread_run()

-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
