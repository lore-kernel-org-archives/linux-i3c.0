Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2127AC87FC8
	for <linux-i3c@archiver.kernel.org>; Tue, 22 Jul 2025 11:14:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=/iAs29Lke+wR9wPTbfVbPWeugNf84pMhxpnr+Y9tM1o=; b=hGtZDC0O+0w4TW
	2plaucOAlg4sY1QFjR5hGJfJBUp+eayC/dPsXIwSC7gzmbcgS3VAGECg6MUkE1Kt11DiZezSGPehD
	dOUPxEJHx+yzI9gHNgrZ/VpTDL5uA/Ie5iUM6KEA+c/IMBALNAaLEFmJMLdD2P27fDLfGTeBKp2iv
	74lPpjeFuxMGrVdWTF8wgFRzIUb2HVA6VipDcLGH8HJgIrEKwoV5mGplKy6O3353eMK+i7A4iKJhl
	CuGyYSkCewLKzicjh9sRYeM/L1CiNxkHCE2hDPLNHC8hNzLnLfkGtZBEnbkhtVOtr1hjNx8nAqaRI
	ADo/cC4NlKi3x/Vedgvw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ueAx9-00000002Fok-3lbK;
	Tue, 22 Jul 2025 11:14:35 +0000
Received: from out-72.smtpout.orange.fr ([193.252.22.72] helo=out.smtpout.orange.fr)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1udlG6-0000000GYFJ-09g2
	for linux-i3c@lists.infradead.org;
	Mon, 21 Jul 2025 07:48:27 +0000
Received: from [172.16.82.72] ([124.33.176.97])
	by smtp.orange.fr with ESMTPA
	id dlFuuyWYqLTrpdlFvuXW2h; Mon, 21 Jul 2025 09:48:24 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wanadoo.fr;
	s=t20230301; t=1753084104;
	bh=gJRVz/YEJYxqdLyzBaVoa58GpKVWf1l4S/w8WDWxRrI=;
	h=Message-ID:Date:MIME-Version:Subject:To:From;
	b=rGZ4Ex8fUiy7IILm6R6Je7lCOpG2jm3/iBBWnBq0npkX0GUJlNlEvI6SEAVWa5Xvt
	 MvADXtgfypf1wX6WWfrJ5GqudiA6waPsDWuLfm4At9zoEyUqaudBSK6e7Si0YPVNr2
	 3iqPoi7fovIpv5/4EcE4QJVQPxpuBRX/mGNw+FMUV6d1IJ8BLzKi+1fUUkkq15HfbP
	 SLmBXJogUoDl76w3LMu8rRhZWnkoNp0oYZ8I23O820g5EGVxcHUnbZFkrft9jC8pay
	 hs3aO/fsMgFo8joV1Xuhdish8r/UTUu68V8FAH0u7uZGB+nmNM0d2bNZ4tpkkb0PWL
	 wDECYDekjweXA==
X-ME-Helo: [172.16.82.72]
X-ME-Auth: bWFpbGhvbC52aW5jZW50QHdhbmFkb28uZnI=
X-ME-Date: Mon, 21 Jul 2025 09:48:24 +0200
X-ME-IP: 124.33.176.97
Message-ID: <c0cac011-cc07-42f8-bdac-620f3faeebf2@wanadoo.fr>
Date: Mon, 21 Jul 2025 16:48:13 +0900
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/1] docs: Fix kernel-doc indentation errors
To: Luis Felipe Hernandez <luis.hernandez093@gmail.com>
Cc: Randy Dunlap <rdunlap@infradead.org>, Pavel Pisa <pisa@cmp.felk.cvut.cz>,
 Ondrej Ille <ondrej.ille@gmail.com>, Frank Li <Frank.Li@nxp.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 dri-devel@lists.freedesktop.org, linux-i3c@lists.infradead.org,
 linux-can@vger.kernel.org, linux-kernel@vger.kernel.org,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Marc Kleine-Budde <mkl@pengutronix.de>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
References: <20250720152401.70720-1-luis.hernandez093@gmail.com>
 <20250720152401.70720-2-luis.hernandez093@gmail.com>
Content-Language: en-US
From: Vincent Mailhol <mailhol.vincent@wanadoo.fr>
Autocrypt: addr=mailhol.vincent@wanadoo.fr; keydata=
 xjMEZluomRYJKwYBBAHaRw8BAQdAf+/PnQvy9LCWNSJLbhc+AOUsR2cNVonvxhDk/KcW7FvN
 LFZpbmNlbnQgTWFpbGhvbCA8bWFpbGhvbC52aW5jZW50QHdhbmFkb28uZnI+wrIEExYKAFoC
 GwMFCQp/CJcFCwkIBwICIgIGFQoJCAsCBBYCAwECHgcCF4AWIQTtj3AFdOZ/IOV06OKrX+uI
 bbuZwgUCZx41XhgYaGtwczovL2tleXMub3BlbnBncC5vcmcACgkQq1/riG27mcIYiwEAkgKK
 BJ+ANKwhTAAvL1XeApQ+2NNNEwFWzipVAGvTRigA+wUeyB3UQwZrwb7jsQuBXxhk3lL45HF5
 8+y4bQCUCqYGzjgEZx4y8xIKKwYBBAGXVQEFAQEHQJrbYZzu0JG5w8gxE6EtQe6LmxKMqP6E
 yR33sA+BR9pLAwEIB8J+BBgWCgAmFiEE7Y9wBXTmfyDldOjiq1/riG27mcIFAmceMvMCGwwF
 CQPCZwAACgkQq1/riG27mcJU7QEA+LmpFhfQ1aij/L8VzsZwr/S44HCzcz5+jkxnVVQ5LZ4B
 ANOCpYEY+CYrld5XZvM8h2EntNnzxHHuhjfDOQ3MAkEK
In-Reply-To: <20250720152401.70720-2-luis.hernandez093@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250721_004826_210635_90CCAE80 
X-CRM114-Status: UNSURE (   9.80  )
X-CRM114-Notice: Please train this message.
X-Mailman-Approved-At: Tue, 22 Jul 2025 04:10:58 -0700
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

On 21/07/2025 at 00:24, Luis Felipe Hernandez wrote:
> Fix kernel-doc issues that reported Unexpected indentation errors
> durring documentation build (make htmldocs) in CAN, I3C and GPU drivers.
  ^^^^^^^
during

> Convert formatting to proper ReST list syntax to resolve warning.
> 
> Changes since v1:
> - Convert return value descriptions to proper ReST format
> - Fix code block introduction with :: syntax  
> - Add GPU driver fixes
> - Remove SCSI driver (already fixed)At

The change log does not need to appear in the patch main body.

Add a --- cutter after your signature and put the change log after that cutter.
This way, the change log will automatically be discarded when the patch is picked.

> Link: https://lore.kernel.org/all/20250703023511.82768-1-luis.hernandez093@gmail.com/
> 
> Signed-off-by: Luis Felipe Hernandez <luis.hernandez093@gmail.com>
> ---
>  drivers/gpu/drm/drm_gpuvm.c              | 16 ++++++++--------
>  drivers/i3c/device.c                     | 13 ++++++++-----
>  drivers/net/can/ctucanfd/ctucanfd_base.c | 12 +++++++-----

Can you do one patch per sub-domains and send them separately? The maintainers
of drivers/i3c/ are not the same as the maintainers of drivers/net/can/. And
there is no dependencies preventing you to split.


Yours sincerely,
Vincent Mailhol


-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
