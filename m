Return-Path: <SRS0=8b81=4H=lists.infradead.org=linux-i3c-bounces+linux-i3c=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E01AFC34022
	for <linux-i3c@archiver.kernel.org>; Wed, 19 Feb 2020 09:04:28 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B05962464E
	for <linux-i3c@archiver.kernel.org>; Wed, 19 Feb 2020 09:04:28 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="skL9T8qk"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B05962464E
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:
	Message-ID:From:References:To:Subject:Reply-To:Content-ID:Content-Description
	:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=cML6a2aCgRG+uTTwg6ydMInVNwL5iSnLI3Es/wix8Ic=; b=skL9T8qkdCJaiM
	pbX2YeQiU3eY7remL3TM4JShv9x4PENpv4rdZjdi2BymlGKOM+8fAJQM5w35g+Yk2DsJku0Xi6rfE
	UHe6oY+/4LZOTNFtWj2aTQSyopTp9cOr1xGtmwXNu8BLkGTweQ2kkGSDFw/XGOmz4Z/t7wreWxJ0A
	G4h5lYLZ1oOdroVG4jfPFImkRIkJovGgDsQh6V/pr+XqDmiFgXRQX6IYoE8xz0bV31SfHQDIq+Xrl
	nR1lWxQE6JAycAYfLNxadUJ4TDvIL6bkUnMityC12VXnSQ4BnFH8Ui+R4xxCWvgcuLEn2tPamILV0
	uhfo706Aq1nLnZhJdD0w==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1j4LHQ-0001bs-6N; Wed, 19 Feb 2020 09:04:28 +0000
Received: from [2601:1c0:6280:3f0::19c2]
 by bombadil.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
 id 1j4H3i-0001ra-B1; Wed, 19 Feb 2020 04:34:02 +0000
Subject: Re: [PATCH v3 5/5] add i3cdev documentation
To: Vitor Soares <Vitor.Soares@synopsys.com>, linux-kernel@vger.kernel.org,
 linux-i3c@lists.infradead.org
References: <cover.1582069402.git.vitor.soares@synopsys.com>
 <a6f65d23947070f52c43fee4a1427745ea675ae0.1582069402.git.vitor.soares@synopsys.com>
From: Randy Dunlap <rdunlap@infradead.org>
Message-ID: <13770b93-d98b-81d7-0cab-92daf9151ee6@infradead.org>
Date: Tue, 18 Feb 2020 20:34:00 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <a6f65d23947070f52c43fee4a1427745ea675ae0.1582069402.git.vitor.soares@synopsys.com>
Content-Language: en-US
X-Mailman-Approved-At: Wed, 19 Feb 2020 01:04:26 -0800
X-BeenThere: linux-i3c@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Linux I3C <linux-i3c.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-i3c>,
 <mailto:linux-i3c-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-i3c/>
List-Post: <mailto:linux-i3c@lists.infradead.org>
List-Help: <mailto:linux-i3c-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-i3c>,
 <mailto:linux-i3c-request@lists.infradead.org?subject=subscribe>
Cc: Jose.Abreu@synopsys.com, corbet@lwn.net, Joao.Pinto@synopsys.com,
 arnd@arndb.de, wsa@the-dreams.de, gregkh@linuxfoundation.org,
 bbrezillon@kernel.org, broonie@kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-i3c" <linux-i3c-bounces@lists.infradead.org>
Errors-To: linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org

On 2/18/20 4:20 PM, Vitor Soares wrote:
> This patch add documentation for the userspace API of i3cdev module.
> 
> Signed-off-by: Vitor Soares <vitor.soares@synopsys.com>
> ---
>  Documentation/userspace-api/i3c/i3cdev.rst | 116 +++++++++++++++++++++++++++++
>  1 file changed, 116 insertions(+)
>  create mode 100644 Documentation/userspace-api/i3c/i3cdev.rst
> 
> diff --git a/Documentation/userspace-api/i3c/i3cdev.rst b/Documentation/userspace-api/i3c/i3cdev.rst
> new file mode 100644
> index 0000000..ada269f
> --- /dev/null
> +++ b/Documentation/userspace-api/i3c/i3cdev.rst
> @@ -0,0 +1,116 @@
> +====================
> +I3C Device Interface
> +====================
> +
> +I3C devices have the flexibility of being accessed from userspace, as well
> +through the conventional use of kernel drivers. Userspace access, although
> +limited to private SDR I3C transfers, provides the advantage of simplifying
> +the implementation of straightforward communication protocols, applicable to
> +scenarios where transfers are dedicated such for sensor bring-up scenarios
> +(prototyping environments) or for microcontroller slave communication
> +implementation.
> +
> +The major device number is dynamically attributed and it's all reserved for

                                          allocated (?)

> +the i3c devices. By default, the i3cdev module only exposes the i3c devices

       I3C                                                         I3C

> +without device driver bind and aren't of master type in sort of character
> +device file under /dev/bus/i3c/ folder. They are identified through its

IMO:                              s/folder/directory/ or sub-directory

> +<bus id>-<Provisional ID> same way they can be found in /sys/bus/i3c/devices/.

                             in the same way

> +::
> +
> +# ls -l /dev/bus/i3c/
> +total 0
> +crw-------    1 root     root      248,   0 Jan  1 00:22 0-6072303904d2
> +crw-------    1 root     root      248,   1 Jan  1 00:22 0-b7405ba00929
> +
> +The simplest way to use this interface is to not have an I3C device bound to
> +a kernel driver, this can be achieved by not have the kernel driver loaded or

            driver. This                 by not having

> +using the Sysfs to unbind the kernel driver from the device.

         the sysfs interface to unbind

> +
> +BASIC CHARACTER DEVICE API
> +===============================
> +For now, the API has only support private SDR read and write transfers.

                        only support for private

For the unfamiliar, what is this "SDR"?  (thanks)

> +Those transaction can be achieved by the following:
> +
> +``read(file, buffer, sizeof(buffer))``
> +  The standard read() operation will work as a simple transaction of private
> +  SDR read data followed a stop.
> +  Return the number of bytes read on success, and a negative error otherwise.
> +
> +``write(file, buffer, sizeof(buffer))``
> +  The standard write() operation will work as a simple transaction of private
> +  SDR write data followed a stop.
> +  Return the number of bytes written on success, and a negative error otherwise.
> +
> +``ioctl(file, I3C_IOC_PRIV_XFER(nxfers), struct i3c_ioc_priv_xfer *xfers)``
> +  It combines read/write transactions without a stop in between.
> +  Return 0 on success, and a negative error otherwise.
> +
> +NOTES:
> +  - According to the MIPI I3C Protocol is the I3C slave that terminates the read

                                          it is the I3C slave

> +    transaction otherwise Master can abort early on ninth (T) data bit of each
> +    SDR data word.
> +
> +  - Normal open() and close() operations on /dev/bus/i3c/<bus>-<provisional id>
> +    files work as you would expect.
> +
> +  - As documented in cdev_del() if a device was already open during
> +    i3cdev_detach, the read(), write() and ioctl() fops will still be callable
> +    yet they will return -EACCES.
> +
> +C EXAMPLE
> +=========
> +Working with I3C devices is much like working with files. You will need to open
> +a file descriptor, do some I/O operations with it, and then close it.
> +
> +The following header files should be included in an I3C program::
> +
> +#include <fcntl.h>
> +#include <unistd.h>
> +#include <sys/ioctl.h>
> +#include <linux/types.h>
> +#include <linux/i3c/i3cdev.h>
> +
> +To work with an I3C device, the application must open the driver, made
> +available at the device node::
> +
> +  int file;
> +
> +  file = open("/dev/bus/i3c/0-6072303904d2", O_RDWR);
> +  if (file < 0)
> +  exit(1);

better indentation?

> +
> +Now the file is opened, we can perform the operations available::
> +
> +  /* Write function */
> +  uint_t8  buf[] = {0x00, 0xde, 0xad, 0xbe, 0xef}

I can't find uint_t8.  Where is it located?
and the braces should end with a ';'.

> +  if (write(file, buf, 5) != 5) {
> +    /* ERROR HANDLING: I3C transaction failed */
> +  }
> +
> +  /*  Read function */
> +  ret = read(file, buf, 5);
> +  If (ret < 0) {
> +    /* ERROR HANDLING: I3C transaction failed */
> +  } else {
> +    /* Iterate over buf[] to get the read data */
> +  }
> +
> +  /* IOCTL function */
> +  struct i3c_ioc_priv_xfer xfers[2];
> +
> +  uint8_t tx_buf[] = {0x00, 0xde, 0xad, 0xbe, 0xef};
> +  uint8_t rx_buf[10];
> +
> +  xfers[0].data = (uintptr_t)tx_buf;
> +  xfers[0].len = 5;
> +  xfers[0].rnw = 0;
> +  xfers[1].data = (uintptr_t)rx_buf;
> +  xfers[1].len = 10;
> +  xfers[1].rnw = 1;
> +
> +  if (ioctl(file, I3C_IOC_PRIV_XFER(2), xfers) < 0)
> +    /* ERROR HANDLING: I3C transaction failed */
> +
> +The device can be closed when the open file descriptor is no longer required::
> +
> +  close(file);
> \ No newline at end of file

Please fix that warning. ^^^^^


-- 
~Randy


_______________________________________________
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
