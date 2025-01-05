Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4D0B8C02181
	for <linux-i3c@archiver.kernel.org>; Fri, 10 Jan 2025 11:19:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=/AZjhz9IeC7N9FrQOyUkMD6+uSllpV4nx0NJ0NbX8ew=; b=GE6KYtwmD011Bu
	FIAgTqIIImCa0QEi9XW+fOc6rS4W4jtZYCFI6kMFI77jOAhVxTchOu6vb75no7zXp9RByGc/k8cBO
	UpriFo3vE8gNDhvJ2DX3SEp4KHISCCd5ZBaX388wAGWo4/8ez34WXznwBoWcjIGfVKw6w5TUEHXA0
	+eDWaCIelHuAnLISQWSHCaBVidVv4aGSnayvvCYX/YDC6RmkIZgrNJtwJpfmZMNeJo/aQo1JAfvFa
	zUqzt8UciskABBuDC6wj8a5Rh06uEofVRJbjjUm3yRru510CSW9V2fV70MG5cNW+YJeTdW1t9s9uw
	oP69mcYMxKwC8YN5l4fQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tWD33-0000000F5Zc-0Ioz;
	Fri, 10 Jan 2025 11:19:29 +0000
Received: from mail-pl1-x634.google.com ([2607:f8b0:4864:20::634])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tUHTh-0000000GBKw-126A
	for linux-i3c@lists.infradead.org;
	Sun, 05 Jan 2025 03:39:02 +0000
Received: by mail-pl1-x634.google.com with SMTP id d9443c01a7336-2166360285dso190003765ad.1
        for <linux-i3c@lists.infradead.org>; Sat, 04 Jan 2025 19:39:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1736048340; x=1736653140; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=g6D/wa1IwTh6EdmkoPQJ2wsfsDe1R0UMTRH3+UOd7Eg=;
        b=bsjp2HsiiHs9/Ln/kkKDujCDInTjPSbN6/6dxDSYmRGwQcqXgy+tgbwMDLF8TxYWrr
         uXS4Cg+y6nDRwM83n4ArI25eILI3pVeqPiwpw2fDSNo5x8Ktvwjd2SChSrQVINnf8PJz
         DrpsuQxFiDdCEiybzCqQ626SpEVpKV55yYaWxZT/50j76hVZQN0fZc7QKPu8KRTaflgj
         LGBwpUp63ODCl1Luvr8vIoZN4Q2xGF/Wq5Q7GBKxB4bYI6kv2EZ3zHHtaXqGeO+GD0Tk
         eFasz4UaGYwstakMC9tcNaL3qIyHJMWteUW6074sipnZNGmO2Z9aFX8N1MoL+vsrUXs2
         XVcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736048340; x=1736653140;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=g6D/wa1IwTh6EdmkoPQJ2wsfsDe1R0UMTRH3+UOd7Eg=;
        b=aFQ+TWhDKGa4DPa12jE0qCSFVuBzz6cExvdMG0PMsZGGt+iWqcM6sQCXOKFphb8Ey2
         fDF6kcwDRnAHQLX+KSsJnaLfKgb111Hfc1SxdpSB7iXnB53Fwu9/reHSosHA2H29uJf+
         +PSmnWZwwMDKNLu9OS7dcNhNjTqJVdIpPeHQBId+zeY0dBbA4xcBPDl5QcDoSt3UnzK6
         eK6lBhHLbrGTTMM0D4+syYieApqLGm0xmDL77yqbzUv4Wvo5yYs8hcNqOm2m9JQVUX+4
         HmQi9zMpgwC/Z83Vte+xhQknMIuhh0+0tkV2+keDGeN3QMCL7H7WWeB+NIX+LqeZKMCL
         3GGA==
X-Forwarded-Encrypted: i=1; AJvYcCVLRM8QsCPIHFolHs4axJqekc/4cI8M7ilP2PZplM1cJhGDoiIen0jjQMtiiwErW1YhCwZhO59BH40=@lists.infradead.org
X-Gm-Message-State: AOJu0YxLCfEyeJLam9oMv2U3+cquTJ5FmcVODZ0fKuhX+lCTrJt6A2vO
	e40a7YRn5mKWr35UpQDWLKk77qSyrP0DZt/Z9Xepe1+HXxdJ9axv
X-Gm-Gg: ASbGncsx1SH8BFGETKcxgmegIbIVJC7KYoGMocmLYk11n9QRdVvGrSGQjb+saB4hRdn
	GWl6vhZ6rMPxW+i7ioBKJEbgmu112dYYORjV7KEx1a0Ji1KYRQIMNAb105DOrZY6yI15gvKNpmy
	Ql5Nc0RXkztRyEY71YzLDVvdBiFr3wrWwlQ5L4SgKI8bF/QsTez+UbqmAGTDqFFVmXdnkgn7EeN
	PZM1DGJteiVNF1MQzIu+X7ZZnWUeiyzn4XGe/+l9f9qfOsTgpIcS2c87gWk4Jekt1naQKRcOxxx
	9Xg7
X-Google-Smtp-Source: AGHT+IFcujW59lIZRak4GyPzLm4B+QCpjzjKY/tXSSyQbMdi8o1a3Pbw/Xg5pu21UzrTWgpOaUnqjg==
X-Received: by 2002:a17:902:d4c6:b0:211:e812:3948 with SMTP id d9443c01a7336-219e6cc87f4mr741172775ad.0.1736048339584;
        Sat, 04 Jan 2025 19:38:59 -0800 (PST)
Received: from localhost (maglev-oncall.nvidia.com. [216.228.125.128])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-219dca028aesm267405385ad.264.2025.01.04.19.38.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 04 Jan 2025 19:38:59 -0800 (PST)
Date: Sat, 4 Jan 2025 19:38:55 -0800
From: Yury Norov <yury.norov@gmail.com>
To: Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	linux-i3c@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	Rasmus Villemoes <linux@rasmusvillemoes.dk>,
	Guenter Roeck <linux@roeck-us.net>,
	Jean Delvare <jdelvare@suse.com>, linux-hwmon@vger.kernel.org,
	=?utf-8?Q?Przemys=C5=82aw?= Gaj <pgaj@cadence.com>
Cc: linus@ucla.edu
Subject: Re: [PATCH RFT v2 0/5] i3c: introduce and use generic parity helper
Message-ID: <Z3n-z5xA2ue8ojiF@yury-ThinkPad>
References: <20241229101234.2896-1-wsa+renesas@sang-engineering.com>
 <20250103221117bb066057@mail.local>
 <Z3hhw_pwFAicsEDi@shikoro>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <Z3hhw_pwFAicsEDi@shikoro>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250104_193901_412307_1215B395 
X-CRM114-Status: GOOD (  14.44  )
X-Mailman-Approved-At: Fri, 10 Jan 2025 03:19:21 -0800
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

On Fri, Jan 03, 2025 at 11:16:35PM +0100, Wolfram Sang wrote:
> 
> > I'll apply the series once you get some agreement on the function name.
> 
> Thanks!
> 
> As said in that thread, the function name has already been changed in v2
> to the liking of the bitmap.h maintainer (Rasmus) [1]. He has not
> responded to this series yet, though.
> 
> [1] https://lore.kernel.org/r/CAKwiHFiamZ7FgS3wbyLHo6n6R136LrLVCsih0w+spG55BPxy8g@mail.gmail.com
> 

+ Linus Arver

Rasmus is reviewer. I'm - maintainer. But I surely agreed with him.
Shorter name is always better. And we're all kernel developers here,
so we used to read and respect comments. The comment clearly explains
what the function returns.

I'm a bit doubted about adding a web link in sources because it may
become invalid one day, but if Wolfram commits to maintain comments
up-to-date, I'm OK with that.

I already acked the patch, so no need to ack it again.

Thanks,
Yury

-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
