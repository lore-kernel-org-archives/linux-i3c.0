Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 89D0EC83F22
	for <linux-i3c@archiver.kernel.org>; Sun, 20 Jul 2025 19:03:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:Cc:To:Subject:
	From:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=zpGFVyugerxZ7DQFsBvD7j+abrV+qV82EZQrMZmVHnM=; b=4JEbNZS++B5TdQ
	AyiRJSeVKXWLmO+rL9A5+DlcIGUd8P2PTgSFM0V80CAu86gylYa8ZXjs84gEsEOT5OCtid9SRGmOY
	udcLAIDsl05+fG2R+vYusgvymILQi2gMxg2+y4GW5vQXuPZeRj9I2EK+Qp4bjLgszUbGTnw9G+mwk
	oLSxk8NVQIW9bI/mAtC58Kd5GHPAS/WLvHw0fGMqH9s4fEKg4kK5kTNAWBAphdvPjAQuv2iKC8th/
	ceGO2HO/y5F8xunazUIQ7EkjowDonTx3FktClv5rQ/q0wY4ssuDNdO+UfUOvUmcrT0K64+e7L+Xmk
	Q7rxdXQ4ytSs7ZEGYR7w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1udZJm-0000000Fe7n-1I5V;
	Sun, 20 Jul 2025 19:03:26 +0000
Received: from [50.53.25.54] (helo=[192.168.254.17])
	by bombadil.infradead.org with esmtpsa (Exim 4.98.2 #2 (Red Hat Linux))
	id 1udZJh-0000000Fe6h-42Cp;
	Sun, 20 Jul 2025 19:03:22 +0000
Message-ID: <1b00e570-f51e-4768-a882-d03252d84534@infradead.org>
Date: Sun, 20 Jul 2025 12:03:19 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Randy Dunlap <rdunlap@infradead.org>
Subject: Re: [PATCH v2 1/1] docs: Fix kernel-doc indentation errors
To: Luis Felipe Hernandez <luis.hernandez093@gmail.com>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Marc Kleine-Budde <mkl@pengutronix.de>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Bagas Sanjaya <bagasdotme@gmail.com>
Cc: Pavel Pisa <pisa@cmp.felk.cvut.cz>, Ondrej Ille <ondrej.ille@gmail.com>,
 Vincent Mailhol <mailhol.vincent@wanadoo.fr>, Frank Li <Frank.Li@nxp.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 dri-devel@lists.freedesktop.org, linux-i3c@lists.infradead.org,
 linux-can@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20250720152401.70720-1-luis.hernandez093@gmail.com>
 <20250720152401.70720-2-luis.hernandez093@gmail.com>
Content-Language: en-US
In-Reply-To: <20250720152401.70720-2-luis.hernandez093@gmail.com>
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

+ Bagas

On 7/20/25 8:24 AM, Luis Felipe Hernandez wrote:
> Fix kernel-doc issues that reported Unexpected indentation errors
> durring documentation build (make htmldocs) in CAN, I3C and GPU drivers.
> 
> Convert formatting to proper ReST list syntax to resolve warning.
> 
> Changes since v1:
> - Convert return value descriptions to proper ReST format
> - Fix code block introduction with :: syntax  
> - Add GPU driver fixes
> - Remove SCSI driver (already fixed)
> 
> Link: https://lore.kernel.org/all/20250703023511.82768-1-luis.hernandez093@gmail.com/
> 
> Signed-off-by: Luis Felipe Hernandez <luis.hernandez093@gmail.com>
> ---
>  drivers/gpu/drm/drm_gpuvm.c              | 16 ++++++++--------

drm_gpuvm.c fixed by Bagas:

  https://lore.kernel.org/linux-doc/20250709024501.9105-1-bagasdotme@gmail.com/

Otherwise LGTM.

>  drivers/i3c/device.c                     | 13 ++++++++-----

i3c is also fixed by Bagas:
  https://lore.kernel.org/linux-i3c/20250702040424.18577-1-bagasdotme@gmail.com/

Otherwise LGTM.

>  drivers/net/can/ctucanfd/ctucanfd_base.c | 12 +++++++-----
>  3 files changed, 23 insertions(+), 18 deletions(-)
> 

> diff --git a/drivers/net/can/ctucanfd/ctucanfd_base.c b/drivers/net/can/ctucanfd/ctucanfd_base.c
> index bf6398772960..f910422188c3 100644
> --- a/drivers/net/can/ctucanfd/ctucanfd_base.c
> +++ b/drivers/net/can/ctucanfd/ctucanfd_base.c
> @@ -506,11 +506,13 @@ static bool ctucan_is_txt_buf_writable(struct ctucan_priv *priv, u8 buf)
>   * @buf:	TXT Buffer index to which frame is inserted (0-based)
>   * @isfdf:	True - CAN FD Frame, False - CAN 2.0 Frame
>   *
> - * Return: True - Frame inserted successfully
> - *	   False - Frame was not inserted due to one of:
> - *			1. TXT Buffer is not writable (it is in wrong state)
> - *			2. Invalid TXT buffer index
> - *			3. Invalid frame length
> + * Return:
> + * * True - Frame inserted successfully
> + * * False - Frame was not inserted due to one of:
> + *
> + *   * TXT Buffer is not writable (it is in wrong state)
> + *   * Invalid TXT buffer index
> + *   * Invalid frame length
>   */
>  static bool ctucan_insert_frame(struct ctucan_priv *priv, const struct canfd_frame *cf, u8 buf,
>  				bool isfdf)

The numbered list is not a problem AFAIK. Did you see an issue with it?
And having the blank line just before the "False" list causing undesirable
html output:

Return

 * True - Frame inserted successfully

 * False - Frame was not inserted due to one of:

Description

 * TXT Buffer is not writable (it is in wrong state)

 * Invalid TXT buffer index

 * Invalid frame length

The "Description" line should not be there.

IMO all we want to do is convert the True and False lines into
a bulleted list and then the html output will look like this:

Return

 * True - Frame inserted successfully

 * False - Frame was not inserted due to one of:
	1. TXT Buffer is not writable (it is in wrong state)
	2. Invalid TXT buffer index
	3. Invalid frame length


-- 
~Randy

-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
