Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9B8ADD37E3D
	for <linux-i3c@archiver.kernel.org>; Wed, 14 Jan 2026 15:01:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=iqTlq7VS33o0UgXNKaPizH70xIdNkjXtoTZ2SesYDPI=; b=Kbky5mDmELcS7j
	7O0QPYdSW8yTAJB6O0jX4cgriMa/k7WLNwUW12y4/jKxmwZzrB1ZWJVDxcg5OZNaNLcoB3WS+6xHZ
	RGXjaUXSBL6qi86il39XudnVqk8KPOiPyxMXbhGpNopAPNKCy77RBiuu+8Q0/JBUQ0XBvykFK6j8W
	pwwTUe8YKpUhviCqKQ/TWx4c1pBQ5U7SC05eiUDcy8y9BEPwRcGJ6O0fxdcNjRTjT+ujgic5cKxHP
	kzuTskdsCMH4GvJ0vhscrunMr6N6npbcKugAcpOTvMSeKM8UBkYSkAfOTO6Yof8BPZ2dSAKxjmHXU
	W+2qL2qnV6sg2LB2wwYA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vg2Nh-00000009bi4-1LSj;
	Wed, 14 Jan 2026 15:01:57 +0000
Received: from smtpout-04.galae.net ([185.171.202.116])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vg2Nf-00000009bgy-2dRr
	for linux-i3c@lists.infradead.org;
	Wed, 14 Jan 2026 15:01:56 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id 819E7C1F1C4;
	Wed, 14 Jan 2026 15:01:27 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 2B98E6074A;
	Wed, 14 Jan 2026 15:01:54 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id CFCB910B6826D;
	Wed, 14 Jan 2026 16:01:52 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1768402913; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 in-reply-to:references; bh=vgow5QxZR2hdHCL2PF3eWKVK5KxDKT3GFVP23mUsj88=;
	b=SwTA265NsH7K4oHlBqpNYe3rXEJkJrNnM7PjugrXuEVzLXaXx9SR+aXcpLH/JsCVBCnPNK
	4T9HB+uf/1ZTiRlNDbUqSfC4x+c52+WboRvAsoOz16d1hSYk8jFCXrjpUNTNq6M4WdDJrT
	7zsPNlT/uC8D8Us/FuaUHyjMfJgBXoelkcA4IA4ZSrlTpuMSWAzI8oxY7DZPNRCHRPUrtF
	kBmrGLYAVM3GgmNAXSalC9hcsRWjyjyuvLI1SkY44v3omTvnvBCLScBTvnjme9mVGyH7cx
	KY4vbX7vxsYEjiLq6WcT2vhK+bXVWPg8TwghcK0oOfqX/g6R8zjo/1oQpGayFg==
Date: Wed, 14 Jan 2026 16:01:52 +0100
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: Frank Li <Frank.Li@nxp.com>, Billy Tsai <billy_tsai@aspeedtech.com>
Cc: linux-i3c@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] i3c: Move device name assignment after i3c_bus_init
Message-ID: <176840281755.1259180.8547629326023625842.b4-ty@bootlin.com>
References: <20260112-upstream_i3c_fix-v1-1-cbbf2cb71809@aspeedtech.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260112-upstream_i3c_fix-v1-1-cbbf2cb71809@aspeedtech.com>
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260114_070155_828873_42483294 
X-CRM114-Status: UNSURE (   6.12  )
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

On Mon, 12 Jan 2026 14:07:22 +0800, Billy Tsai wrote:
> Move device name initialization to occur after i3c_bus_init()
> so that i3cbus->id is guaranteed to be assigned before it is used.
> 
> 

Applied, thanks!

[1/1] i3c: Move device name assignment after i3c_bus_init
      https://git.kernel.org/i3c/c/3502cea99c7c

Best regards,

-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
