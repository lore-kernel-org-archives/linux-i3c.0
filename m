Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 246B3C021B8
	for <linux-i3c@archiver.kernel.org>; Wed, 26 Feb 2025 15:22:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=NYVTmacirmEEcfRb+V8v6l35igQS8350lMWf3YloJik=; b=yTkJsOhdj+5HQG
	tHuaGyn5tu9jVasSMF4iJmcNPoX7UiLCG6nInMyCG36ur4Hjv5+D4mfzlf26hzNiVRMYZKQkrGFVG
	4LfeUz0VsOzhKuseUpSrXPerslZdKpMc3AzfXa4RCJoqpbeQi89pvcqsFzX/DiYH3mN79b/6/C3BC
	VuN5Gz6957PD4a2GJQx5LtaETY9qVRoB4nUAOh+9mEDYkio02KrGgf3fPhUJLUrC+cBj7uvREOSM6
	bKc1Tq3pzKbixcIV+v8Mw81zqQXBg8wvfoCYupftTFNcX6lI/4W5JqiSH0QUFRl/f+kGd2dnUGjYS
	A/92eQmU7OTJaI9n4CTg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tnJFR-00000004GdZ-3P8I;
	Wed, 26 Feb 2025 15:22:57 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tnItA-00000004C5t-12K9
	for linux-i3c@lists.infradead.org;
	Wed, 26 Feb 2025 14:59:57 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 6E2315C68F8;
	Wed, 26 Feb 2025 14:59:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C8E8AC4CED6;
	Wed, 26 Feb 2025 14:59:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1740581995;
	bh=5OsdiBDxPu2iv1r0X9avBecbm1x9d/4DtgPaMujJESg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=pf82xsg3k9jh8QtGaWy1eQhTi9IN3uysZTF363aSirodmtrEFH37HTQrBGfud7KOy
	 xqX82R/DyaRbsNK/JrD4zRJsehcO4Jr5KnUI8wjr5wMS4s/sVmZu9ylppoETZ9yC7g
	 87OQBKgk6AFeQ34A2UAAXRA1jVd+Cco5qkXQcK3OJ59waQsDK1X9zLZkkiCBsFAgCP
	 cLAmYpv2RQIpQt7xmOb7rBHpWs68gdyK2V983VU2YsY/I5fiXoa1ugF54UkGeUuKOG
	 Rn9ZoT3aZGSaO5kFbRxKo5PYJ/aNWwqwNN1om6ZW11Xxk+cIJetbgNZgS20cbcQdfO
	 t7Ypmvo/hOPyg==
Date: Wed, 26 Feb 2025 08:59:53 -0600
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Michal Simek <michal.simek@amd.com>
Cc: "moderated list:I3C SUBSYSTEM" <linux-i3c@lists.infradead.org>,
	"open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>,
	linux-kernel@vger.kernel.org, monstr@monstr.eu,
	michal.simek@xilinx.com, Conor Dooley <conor+dt@kernel.org>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>, git@xilinx.com
Subject: Re: [PATCH] dt-bindings: i3c: dw: Add power-domains
Message-ID: <174058199256.2331808.4044534396247326953.robh@kernel.org>
References: <fb8adcd318b1023ca6b90d294e46ae3b59dc1280.1740490666.git.michal.simek@amd.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <fb8adcd318b1023ca6b90d294e46ae3b59dc1280.1740490666.git.michal.simek@amd.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250226_065956_338551_4CA16E91 
X-CRM114-Status: UNSURE (   6.86  )
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


On Tue, 25 Feb 2025 14:37:48 +0100, Michal Simek wrote:
> Describe optional power-domains property.
> 
> Signed-off-by: Michal Simek <michal.simek@amd.com>
> ---
> 
>  Documentation/devicetree/bindings/i3c/snps,dw-i3c-master.yaml | 3 +++
>  1 file changed, 3 insertions(+)
> 

Acked-by: Rob Herring (Arm) <robh@kernel.org>


-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
