Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 86120C3DA4B
	for <linux-i3c@archiver.kernel.org>; Mon, 15 Jul 2024 21:48:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=gyqv7h3cBZ6aaJEcTVM9WbO9Z359wZbt68tywAzTHSs=; b=GvmRDyjBCBy4gJ
	F/3pQ+fAukHlShl7niyJ3QFQpL58dqYkB0Db1hZ4HT6aIg52r+zMgcDSn13urOIpjTjQHy5QAIiU2
	eBeI4iTrhL+9klsNbuZztkSND0tZ/y5SwwKVeFiT4JrFH84Nt85LkL+CSzZR7Ju5Ffgc3J+6j5z+W
	hW3BfvlyF/2kp/bHvLmLf35CQTohMYKlbhzCJU7huVbWocYZkHoovfLP0dFGEf+BH1S4JmFpd+bFJ
	XV+vzUFvIxN5LxrtkPdcUiDuWEnCX5KeZ2oz/7Hm0skY/Da520CTTssZ94zeeV1575fP3B6ILKATw
	uen3L+o5bQ6VnJWi6CCA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sTTYR-00000008Vvc-0Dwv;
	Mon, 15 Jul 2024 21:48:19 +0000
Received: from relay2-d.mail.gandi.net ([217.70.183.194])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sTTYO-00000008Vu2-2PtT
	for linux-i3c@lists.infradead.org;
	Mon, 15 Jul 2024 21:48:18 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id D7F3A40004;
	Mon, 15 Jul 2024 21:48:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1721080091;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=bu60QzsM2TFLIWO0vGxknFJil2R7GrMrQFYycAY9a7c=;
	b=NyFwTbqcN2AQwDW+pQuN6pl2iS4y+CbLCREiPmgvmKuLv7V+XiCXzbJH8Z3ZNYu56A5TCu
	BkqzuSrZ2te5r74lr//ZqjLVwyo1Pd251RfYp5D209qSft6a94ZoFtKU+md+Y/bVkKNUUT
	ShKVpWrqPMDZEK6+4CgKxvtEr/W+Vf8rtZIChUJLXxr9VbAqPNRNIKRdAplQnPzccqf1kk
	ViQLLKqVMUoML2JJYY7WklI6nfKMfe+r887JN7du8YY8guCODe6FOfwooMkEq46zAgRwmT
	rGJbxmL/7axGrhIQUupsZKJLWU4wmPFsoE4C40zcbPq4j4QS1905IgYfsK308A==
Date: Mon, 15 Jul 2024 23:48:10 +0200
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>,
	Conor Culhane <conor.culhane@silvaco.com>,
	linux-i3c@lists.infradead.org, linux-kernel@vger.kernel.org,
	Frank Li <Frank.Li@nxp.com>
Cc: imx@lists.linux.dev
Subject: Re: [PATCH 1/1] i3c: master: svc: Improve DAA STOP handle code logic
Message-ID: <172108005328.1453338.6420836318188767994.b4-ty@bootlin.com>
References: <20240702223107.403057-1-Frank.Li@nxp.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240702223107.403057-1-Frank.Li@nxp.com>
X-GND-Sasl: alexandre.belloni@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240715_144816_769041_AD07DD09 
X-CRM114-Status: UNSURE (   9.81  )
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

On Tue, 02 Jul 2024 18:31:07 -0400, Frank Li wrote:
> The REQUEST_PROC_DAA command behaves differently from other commands.
> Sometimes the hardware can auto emit STOP, but in other conditions, it
> cannot.
> 
> Improves the code logic to better handle these situations.
> 
> Hardware can auto emit STOP only when the following conditions are met:
> - The previous I3C device correctly returns a PID and ACKs an I3C address.
> - A NACK is received when emitting 7E to try to get the next I3C device's
> PID.
> 
> [...]

Applied, thanks!

[1/1] i3c: master: svc: Improve DAA STOP handle code logic
      https://git.kernel.org/abelloni/c/a7809cb368b9

Best regards,

-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
