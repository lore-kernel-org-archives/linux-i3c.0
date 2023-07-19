Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B8571EB64DA
	for <linux-i3c@archiver.kernel.org>; Wed, 19 Jul 2023 06:27:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=8c1QP2KaEvR7Gbk7HAEkbDTJXmQAU+JLASu2W/Ub+ww=; b=rm0tVZbE6+VIQf
	gIC57LyOYLIXbtJM7gSLZwyjbQx50w3YexinRoGV53sVXpAc3eaA1JL+Sj1iqdWaE0v678xEINvOx
	+dMjtKZLJGM5c0Dlf97zmJwXAJ3us49OUEksEu1oFArNHWZAPLRbdsKkL0tXBkFd7Fbkwiu7lF2Iq
	0FhVY6XolHwWjDd5BRdLTX/EHkF7ACVKpp5IsbSfoqM8dp6G0BkXIs9PGCiS6f4+sm4tDob6x/Wvx
	yJdMwhbvHrvPzIY610HMX4QJ/K+mbyHb6yLdzZZ1oiqkrwNcrkmLxtIjYl6Vd4GeHEeFo3fwAfAEx
	c4K4sHwQ90zhVzjZBZ+w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qM0f3-005jjr-30;
	Wed, 19 Jul 2023 06:27:45 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qM0f2-005jia-2G
	for linux-i3c@bombadil.infradead.org;
	Wed, 19 Jul 2023 06:27:44 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:From:Date:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=TPySumXy93YyxDr5qi2r597lY8mrJTG8wk6LJ/+d1sY=; b=ORsV3Q2aj3k2j6yT5DuPctUb1O
	ED/vI6HMVPcoKjOfUwiToUeTza+sKGzWTfkV7vTjQL/OZs+7/n3iNMcenD0jKV463x4gqGUh0DicO
	LeFApDxYgASCJJcJqn37AF2feAEvm291PJ5J6ByzxcqWarAzSqqQW5o18yrleMJidkUUrkkJaPMRj
	Igthch4ubGKBcpWHJMVPIi40/amLRqw1b2yNgVvLYu6Z/akFkGMYuwWWbZGEEXntmmoL/YQnWBiFD
	grzAYyjNxAEGz0TCoP95eOsVNTJ6P8Zrbq4JgEcf2KMBKe4PL0avKfd/hzFHYaYc/SmCTDNNWZEVZ
	njJ+sJVQ==;
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by desiato.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qLwUQ-00CSBQ-1q
	for linux-i3c@lists.infradead.org;
	Wed, 19 Jul 2023 02:00:32 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 072806165F;
	Wed, 19 Jul 2023 02:00:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0248AC433C7;
	Wed, 19 Jul 2023 02:00:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1689732023;
	bh=YJwEPUJUXPlvFsSXH2e3p2Mw9pqwhdhxV4QFcastR9g=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=fgan/RFxYujq4+DYr8RrKxbXGaI5zPyPE9U8OR8/uSsGVIEQNSqq4XBxKdXzNiwGn
	 56OlXgaFreH172ua/f2A1iJQxo0e4lrquYY78ceHZ0/qgDz14pmn9yqcUBj5uud2WZ
	 QPhVb7HBWN9QphAXDZdmx2NxDFD9ebKUFMl5v6rx5RSzG4U7cyOeq/hLBGR+qETajH
	 Gum+sqxdr6yStAgrnVe7hBF4fhX6+aMycDby6DAmXT3LXpWrsqUmAvP5ayhOLT1+8W
	 plK75tKEyf5NVx879BhFcfwbnrfpKXcohEAp6/4I+HEImplJl40XOa3YbKKZ0ohyjj
	 4FWNVJzADbdgw==
Date: Tue, 18 Jul 2023 19:00:22 -0700
From: Jakub Kicinski <kuba@kernel.org>
To: Matt Johnston <matt@codeconstruct.com.au>
Cc: linux-i3c@lists.infradead.org, netdev@vger.kernel.org,
 devicetree@vger.kernel.org, "David S. Miller" <davem@davemloft.net>, Paolo
 Abeni <pabeni@redhat.com>, Jeremy Kerr <jk@codeconstruct.com.au>, Alexandre
 Belloni <alexandre.belloni@bootlin.com>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley
 <conor+dt@kernel.org>
Subject: Re: [PATCH net-next v2 3/3] mctp i3c: MCTP I3C driver
Message-ID: <20230718190022.66268d21@kernel.org>
In-Reply-To: <20230717040638.1292536-4-matt@codeconstruct.com.au>
References: <20230717040638.1292536-1-matt@codeconstruct.com.au>
	<20230717040638.1292536-4-matt@codeconstruct.com.au>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230719_030030_869502_6026543E 
X-CRM114-Status: UNSURE (   8.67  )
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
> +/* Returns the 48 bit Provisioned Id from an i3c_device_info.pid */
> +static void pid_to_addr(u64 pid, u8 addr[PID_SIZE])
> +{
> +	pid = cpu_to_be64(pid);
> +	memcpy(addr, ((u8 *)&pid) + 2, PID_SIZE);
> +}

put_unaligned_be48() ? That or you need a local variable or something,
because otherwise sparse is not happy (build test with C=1).


-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
