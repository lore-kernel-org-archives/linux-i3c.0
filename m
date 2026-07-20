Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 21765C44524
	for <linux-i3c@archiver.kernel.org>; Mon, 20 Jul 2026 16:16:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Cc:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=7fqfTdeebICbEtN4pVE13YrTky4UbfJklcPyVejWwzs=; b=b3NX9IE9/xCrjF
	Pt06C58kIj2fSnIGKfbSAcma+vRCu3YkHs56lBzGwSqhwblDJvi8if6PX+68WQbIR8QDHwVVBYfko
	i2CGjwufUZvjWt6ydC+NbcHc5WTSU+qnlLUDbwt3ddW0TulwiOj5tDX80bktKGaxNfQF2bkpIhgCK
	A0/lInO/tcmu7VLASOUeyky5YZibEF0TUzaiGlBxB+ewPg9C7np2VZJ3RfW0KUNnK20ZFHlp+fK5V
	M/V/S4piOBZFVC0K3jFAjqXqkT5r2mmouoTPAnjUiw1guMMRZ0o8ciYAdcUJTED6OWn8vAizHRG4T
	b9p75lBwcTdfizSdxD6w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wlqez-00000007LLw-3TXY;
	Mon, 20 Jul 2026 16:16:05 +0000
Received: from smtpout-03.galae.net ([185.246.85.4])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wlqew-00000007LJn-0WoV
	for linux-i3c@lists.infradead.org;
	Mon, 20 Jul 2026 16:16:04 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 2CB5E4E40E75;
	Mon, 20 Jul 2026 16:16:00 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id D766360360;
	Mon, 20 Jul 2026 16:15:59 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id ED2B711BD3CC1;
	Mon, 20 Jul 2026 18:15:54 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1784564158;
	h=from:subject:date:message-id:to:mime-version:content-type:in-reply-to:
	 references; bh=E+KW8apzPeuJJFrU4ZzXm/UBjJRlt54+RYJ6SJW+mtY=;
	b=1Xl27wOfuq3BTeu9UHmjXTLT4Tz0BR4YjxJbZI05DPWE8VT+3t9XfEJe3H9AktcxRzwX1o
	vy8KeVgxwWTMV4hkW2tB2R0acIQdzRNAzvqTTN02LYX+Qw6Fh5QXsh+JJsedt9tegkqXBb
	sycqkWK0gORgnVg7sLZWzqrDseSWqXG4egMTMszLqbsmd9ilJ0gUwThgtENJFrJW0UtB/N
	zjRxbdbLCBenRXU4guB2O5Ae/5fbyhbEPwAxB0OqO0dO6HASJ7i4HC8/AnKm7wKXqFRBJH
	BVj0rUbqxX65us8JrDA7LbcYijPaVwprbPy618/fJ1XNHyjJrOXa8I/eQ6u5Iw==
Date: Mon, 20 Jul 2026 18:15:54 +0200
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: Frank Li <Frank.Li@nxp.com>, linux-i3c@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Jorge Marques <jorge.marques@analog.com>,
	=?utf-8?Q?Przemys=C5=82aw?= Gaj <pgaj@cadence.com>,
	Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	Adrian Ng Ho Yin <adrian.ho.yin.ng@altera.com>,
	Felix Gu <ustc.gu@gmail.com>,
	Manikanta Guntupalli <manikanta.guntupalli@amd.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Adrian Hunter <adrian.hunter@intel.com>,
	Jarkko Nikula <jarkko.nikula@linux.intel.com>, imx@lists.linux.dev,
	tze.yee.ng@altera.com
Subject: Re: [PATCH v6 0/5] i3c: Improve CCC reliability with actual_len,
 validation, and Direct GET retry
Message-ID: <178456413898.83935.17006528519078741282.b4-ty@b4>
References: <cover.1783493867.git.tze.yee.ng@altera.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <cover.1783493867.git.tze.yee.ng@altera.com>
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260720_091602_325297_F287D934 
X-CRM114-Status: UNSURE (   5.47  )
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

On Wed, 08 Jul 2026 00:17:36 -0700, tze.yee.ng@altera.com wrote:
> From: Tze Yee Ng <tze.yee.ng@altera.com>
> 
> This series improves I3C Common Command Code (CCC) handling in the I3C
> core and master drivers. It separates requested and received GET payload
> lengths, validates GET responses centrally, and retries failed Direct GET
> CCCs once by default.
> 
> [...]

Applied, thanks!

[1/5] i3c: ccc: Add actual_len to struct i3c_ccc_cmd_payload
      https://git.kernel.org/i3c/c/2805eb4d075b
[2/5] i3c: master: Report actual GET CCC payload length on success
      https://git.kernel.org/i3c/c/295508ae7c30
[3/5] i3c: master: dw: Map CCC hardware errors to I3C M0/M2
      https://git.kernel.org/i3c/c/b5151c6e9cdf
[4/5] i3c: master: Validate GET CCC payload length and retry Direct GET once
      https://git.kernel.org/i3c/c/02cc832191dd
[5/5] i3c: master: Add optional_bytes for variable-length GET CCC validation
      https://git.kernel.org/i3c/c/4a51ae0a1b11

Best regards,

-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
