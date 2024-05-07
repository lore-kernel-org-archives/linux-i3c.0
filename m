Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3280EC10F1A
	for <linux-i3c@archiver.kernel.org>; Tue,  7 May 2024 21:05:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=zz03J19ykCUOaCV0FGBG/UHFDPBcYsmM8m/ETSIa5ZQ=; b=ukArlR3G+EbjL4
	5ZaGFiTXZgn/zMjA3SxkH/mPUmcbybDRq0yN8Ok5oWf0RqUzepJAGtuyg/vZncc/1ekcuLiQh5wtG
	AoWRGj2BJIf1Kzrmv51FZ+q7jPuYpmBUj5yfWAAS5gJjDUdDHFuMrilCIS9FMvW5Rjg8Umtw0/LCb
	ZaFcz4N19omLbrPAi+mcqpxaDC8zJg7ieOu4wuJFMB3T7Tv5iKMfX18rGlw/rQI2yKZ2f557ZP0i9
	z4zGr0Ra6ZpSb7ndLOWbP8+PMtRCN4AdO2tVn13M3vK/baYG8jEvfAQo1GKLM7S/0iG2GG01T57qP
	SmmWJmRm/kN/Oi+lwt8g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s4S0a-0000000Cq6C-1vZs;
	Tue, 07 May 2024 21:05:56 +0000
Received: from relay2-d.mail.gandi.net ([2001:4b98:dc4:8::222])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s4S0X-0000000Cq4m-3Gkn
	for linux-i3c@lists.infradead.org;
	Tue, 07 May 2024 21:05:55 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id CADD940002;
	Tue,  7 May 2024 21:05:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1715115941;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=frZQIdG72+aRABW5Ri2Oocaq5EiG3vpALSpmJr9JuLA=;
	b=QcIX9YCC1pc/tqho9bJXaBf3Z37vqTFgJ77Vgw9TXWAWSSa4Y+9EADooYCx2csW745N5ZB
	BxTWGjEyA0BzpTW9kFppGsBQWejTkLm1cTM4TSpquTqV2j422JDfUQpehy9GbNTVacsjjg
	zyAjxABNulzBSK6aJvB6Q+uyfimoR5zJDiCQUhXf1nWtfoB5B6t9SMuHuoYtwMK/jpa0ik
	kBnfAOEMmcJ61Ns7lSR4XFgR3c5nds52F9oBuxr82j2euUub/1nyeBnzKn5VMPRpgWgy4C
	eZHGdJ0SkkhbGGpCZZjjcPMOg5D5LlXtujZOcvWVjbrssYWv+BYqMYQ7HeUS0g==
Date: Tue, 7 May 2024 23:05:40 +0200
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: linux-i3c@lists.infradead.org, linux-kernel@vger.kernel.org,
	Mukesh Kumar Savaliya <quic_msavaliy@quicinc.com>
Cc: andersson@kernel.org, vkoul@kernel.org,
	manivannan.sadhasivam@linaro.org
Subject: Re: [PATCH v1] i3c: master: Enable runtime PM for master controller
Message-ID: <171511593074.988529.13434042703638402613.b4-ty@bootlin.com>
References: <20240228093407.4038399-1-quic_msavaliy@quicinc.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240228093407.4038399-1-quic_msavaliy@quicinc.com>
X-GND-Sasl: alexandre.belloni@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240507_140554_134223_8609C5CB 
X-CRM114-Status: UNSURE (   7.23  )
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

On Wed, 28 Feb 2024 15:04:07 +0530, Mukesh Kumar Savaliya wrote:
> Enable runtime PM for i3c master node during master registration time.
> 
> Sometimes i3c client device driver may want to control the PM of the
> parent (master) to perform the transactions and save the power in an
> efficient way by controlling the session. Hence device can call PM
> APIs by passing the parent node.
> 
> [...]

Applied, thanks!

[1/1] i3c: master: Enable runtime PM for master controller
      https://git.kernel.org/abelloni/c/fe23b69d78d7

Best regards,

-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
