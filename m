Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 83D28CAC592
	for <linux-i3c@archiver.kernel.org>; Tue, 16 Sep 2025 17:08:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=AGhH2135V+2dS20QdVtUIsOZr3SlnZr3O7vhMU0SPJ0=; b=j/Q052MmzbDMBp
	2ac1PEx0sQSE1pBrYAotoz9IiEjhfF3HgeCeHTaEoFXdERDXNCJKkEXCLdi5BnRq5zJfxoK52OtDH
	BZaa02eO+aaAzmd5uHGaGow+GgHgE8kIBtAcY3xjGQqwmbpU3VItebzUSUnq6Zr/j9ufHb9TYwybz
	0zgD41T2RdCkTqzR8PT5qsgNMukKd9uTJnEuJkNaTZaCFQdMBgJgQUJyU8xWVeFk9D8c5ZD21a9ht
	326LtmgUWIqJUKuGLHUTcKVOcSbyRrU14Vl9IjJmXZb345eHJy2F06AQMDGvXvV2pFisyfAVBqtKD
	9lN6GeH/qYWRzCIK8FqA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uyZAo-00000008aMB-1G3w;
	Tue, 16 Sep 2025 17:08:58 +0000
Received: from mail-northeuropeazlp170100001.outbound.protection.outlook.com ([2a01:111:f403:c200::1] helo=DB3PR0202CU003.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uyZAl-00000008aKg-3FnJ
	for linux-i3c@lists.infradead.org;
	Tue, 16 Sep 2025 17:08:56 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=mRLDur3gl5wYRUyh4PuQVZ1RmIdxSgPV/Rg6Au2YU1ni8LmZqNcE2570kMi4fxsm0alYi9W4t+2pNsWm8X8mRFwh9iz3QmXFn9YkrgJc7bjcoKkYbzcaAAWUl0dZ0gWivHZuInZ8BT/eIJtx1aiUXyxtiK+8ep6dB3ZJjL09vgmNC/doplr2URaxQJI5wIiE75yFRPjF2bd2/6dGqOOEBAE2fFVrKRpSnlKvSyWs3FaoXxUCaNJBTm5PukhyLroITcHxUkhbu5oMVIEBKR/6IRSryIj/kNLpI+33MPYKWCquUQro5SkbsN2c5D+N/gHqkix7QX2V3eCeX1k7hfIFng==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FOtOlIZX9sfmXl1VJGswhRJkauP7IXVSd15GmcZQrDQ=;
 b=wQOQ6LOKOkkzbYKuNPpKCjbicf/Y5XpMKTpcMZDJv+2IyTwB+UZfV7M18+NhG5I7u+hYmC9Ki2WSBvHecfZoqoEKn2l7zu8D7TcpR9WYjjygzKzw8GoXEoXhonFf6JH9BQqIjIyZWjNlWYzvrYUHWrRPGsRJ33K/JIAZtAHfolwCJPUft4HF6m9XWqvDvlDHFZsfqt86goiKJ7KIQzcOH3H1GbT0ufsaYigRtstdd3SzyHFVI28v5NaDxe3olfolFhRYosEhXYj1rsqIG9LM71RoN1O0rBAgGQVSAcUyXsAnWUC4o4dkbyIXEhS+487U3sLRKrmfugFfq4XsgUUrlw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FOtOlIZX9sfmXl1VJGswhRJkauP7IXVSd15GmcZQrDQ=;
 b=TkuYIZj6lPNU99yB6D8+vV0Lx3dyuAR/kK8S3rYqKXMlT4hqDUt3Nod5D/QpQQLjlfXnoonc+eV3HvoCVM269GNu57LyeCWE+ASuiRKykxxfGc7BLwOVI+NkQQiv57xCea+8pSy5fT436XDQIoT6Mqkt3QCI0alXkONEOeq4fqv+DAriP29g/aTxCSnrl7yxB+PAs/2e+LSx/rU47apgXmX0fGCddikkbQS90FhHiDtO3ECKWEoZW5RHdRzq7/rlCJeCiEkI4y7W30nPnF83x7BmiduoO3JHqiDAPrbcRCU246jSEwwujznU8xS9KooTuBqMbPUsIxAzsdXWwjzKPw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AS4PR04MB9621.eurprd04.prod.outlook.com (2603:10a6:20b:4ff::22)
 by AM0PR04MB7075.eurprd04.prod.outlook.com (2603:10a6:208:19e::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9137.12; Tue, 16 Sep
 2025 17:08:50 +0000
Received: from AS4PR04MB9621.eurprd04.prod.outlook.com
 ([fe80::a84d:82bf:a9ff:171e]) by AS4PR04MB9621.eurprd04.prod.outlook.com
 ([fe80::a84d:82bf:a9ff:171e%4]) with mapi id 15.20.9137.010; Tue, 16 Sep 2025
 17:08:50 +0000
Date: Tue, 16 Sep 2025 13:08:44 -0400
From: Frank Li <Frank.li@nxp.com>
To: Boris Staletic <bstaletic@axiado.com>
Cc: "linux-i3c@lists.infradead.org" <linux-i3c@lists.infradead.org>
Subject: Re: i3c: scanning for i2c client devices on the network
Message-ID: <aMmZnG/sbErB4Ly4@lizhi-Precision-Tower-5810>
References: <DS4PPF71D32B30E58BEEB807E76DA5FF106DC0EA@DS4PPF71D32B30E.namprd18.prod.outlook.com>
Content-Disposition: inline
In-Reply-To: <DS4PPF71D32B30E58BEEB807E76DA5FF106DC0EA@DS4PPF71D32B30E.namprd18.prod.outlook.com>
X-ClientProxiedBy: PH7P220CA0124.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:510:327::27) To AS4PR04MB9621.eurprd04.prod.outlook.com
 (2603:10a6:20b:4ff::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS4PR04MB9621:EE_|AM0PR04MB7075:EE_
X-MS-Office365-Filtering-Correlation-Id: 6d2c2c22-70e0-4a21-6da8-08ddf543b4c9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|52116014|376014|19092799006|366016|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?ZY+C8vne9KoGAtDRkxegcP8JT7zAoVRB1BjfnArOay66jByCeV6IS8G1+3gz?=
 =?us-ascii?Q?eVr0kNgp8Z2ISHZWTGq/03GdotJudtuxQJuL0cWDFlCOx26PN7wnFtHkFGch?=
 =?us-ascii?Q?4UgF8NW+8/OAK3xZYjPyRYlYm17LnNTWI3+pKnre5taIHk8JpLYjXXPjmOKn?=
 =?us-ascii?Q?TSW1PVvhnWdHYIBfvNBfgCRErp2pAPoKXGeI8axQx8M2HTXW4q5314k99d5p?=
 =?us-ascii?Q?sIG1HtasGPzdtUpYsAoKNDdq7J3BVX/HvIQSMpyZEtFBKft6wUfewBFjKneh?=
 =?us-ascii?Q?Xzt0Ym/QYVX9nT1bWBNQL7Awan30r6P7LtuetUlWQksHatuEGtCVWDzxbRiK?=
 =?us-ascii?Q?lVwGU0+Su/2bpiv/RNju7UEmIvp4j3U49WpFbHGtpogvLtjPvoJ30ROrBXS+?=
 =?us-ascii?Q?GMapIo+f2N7EpXJ0YXRzxWiYcS4U6rszDbTvt+z+nbBM1ebZbjCcfJ0iesWu?=
 =?us-ascii?Q?br+DYhhGxNBgFMl8QsN9NBnaJlHascBV6iGnTXkZyaPPUdHRcIcCyGEx1xcJ?=
 =?us-ascii?Q?6JCDQ8lYrwS0ZSTO1PnoNnihHBT+u3hgxBBY9ALEQ3cZeDxfC+4j2/b5UQAW?=
 =?us-ascii?Q?pbSqJaasraPw64PRUPrCQEbo0L8jctyMfdIBgjrZewek9Czkkb2j1L4x5Q8+?=
 =?us-ascii?Q?d/0viv7H/rpZW8zuGaZ1VvSHhH8lCKnxoBH2K4UP5+VP1Zvo5JuZlDSHtTFr?=
 =?us-ascii?Q?93Vc/jBUmHdlBQUaNXYDcayOqmKoYE732xes6LNAqfmI6YFn697av0mvUpnu?=
 =?us-ascii?Q?04bJWrZjPpy8iTIj29YREdSFVXdxURaBnPGwK9+b0BUV/+nHBWJN+W+3ZoT+?=
 =?us-ascii?Q?tdBKfwNXmjrxhTK/kFU80cxsIU3MRQK+vlEDXe94c8uPnRXT2M05Y6/tuTh/?=
 =?us-ascii?Q?9xGcyuh/q2CD7wTbldgCtE4yOHLylwfKP/qCMOMIc/HJ2Ud55JAkLsJx5auz?=
 =?us-ascii?Q?+NC2vhT2fttyqVwoQDpOuhHOXV++rzQ/3cx99X538dRc01G7iYUbw3Nmsk20?=
 =?us-ascii?Q?l00BKD+E3CQi8x8Ii3ukWvoi3zfSEVHPLzYN6c2Pyp8Veop+C7T2dIQfRCHC?=
 =?us-ascii?Q?ePEnVYSFDqnq9trLbn53OMS6cpq36v83kGGyie1OK1mQVQfxH/t3F7JVUmmi?=
 =?us-ascii?Q?P0IqECcCriyuv7+St35b/gMq4V3J18CWgCE8HwIBjpFQD+pQ59nwGg5LQlAz?=
 =?us-ascii?Q?AWhrNFkerGQmtQs+Pk+6GKKHHCpvGaKwvfSk7iT9Xuy1iU42zlw+nxBRwtS4?=
 =?us-ascii?Q?SRIUqMb2IbMKWgtRZyoGtXWmAry3CaNj08vHQdJbgLUWd6NeYtUSTBUJBwop?=
 =?us-ascii?Q?GyXll1qOWKrkFwLoh0Vo0BdfXoTmTF310zQpHQAm0uIRrLsf6XzaE9F2Mu8I?=
 =?us-ascii?Q?v5X9vB+NcSu+6V+lNK9slU+sJzk5b9sl6bcdL807FZ2OHR0KUtarK2ZOma0r?=
 =?us-ascii?Q?X0KV8N/bNl54Wc9QbchAZDz06OcbjdLtofSG7dWQih5g2nxG3zbr3UCaV2mf?=
 =?us-ascii?Q?9oCu7FdE3id7SWI=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS4PR04MB9621.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(376014)(19092799006)(366016)(1800799024)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?+DCWdu5DE03qUZOeRXDP/aiWJrBbaxSenBJ+j9GOfJL9Cfpf+Nu7UYb3aT34?=
 =?us-ascii?Q?KoVgSKnZsBBpl/2oqk37ikkDMadK4lsULCJENJ3TEPU2Sc3MYubzPRzWG3mQ?=
 =?us-ascii?Q?SasbdA0RbloW6tuX5so+PZgZdXdvW+YgZeYEc8pHSASW2sasXuAES2I420Wm?=
 =?us-ascii?Q?TrmRPWfHCulzuorW8p2frc1ZgQNUuzK/z0wW391HkML5IVB4cxcS0sm0oELO?=
 =?us-ascii?Q?LTFGhAeheYBzAgXXTTE1LSuqUIejevbAxxJE7K9hF2rBKxFmJS7esnit5D5Y?=
 =?us-ascii?Q?jIKxsbd42azxXWuT0b3wgqlT7U7MJ3K0RJXMY8z5Sj80SV+qJBUlNbu4Nit1?=
 =?us-ascii?Q?cH1Wuh2eh+3jh0fLZ1rXUMZ6egC6pvX45+Ne+jXYesfEwhaRvIuqLTgwDlis?=
 =?us-ascii?Q?g1z+D+7sdS0OF4uweGltEeIlbkyc24PmxZhElXazkL8bGoIRYy3wGROeR54H?=
 =?us-ascii?Q?mq68u3/WM6RQkUfo/KcgBuLxzQvpwGNq/iaZOVPSUupUGRNfXVcR4Kqs7J1Z?=
 =?us-ascii?Q?AeivVi2rwXPOXxMPBma5dP+45X9OHn3gfsraU8LYeC8SafyF+crOPgnNz5Cz?=
 =?us-ascii?Q?cJqn2Z/MkKnncBm0zs4W/GiufoJroV5htPzBu9taf9+X5nko4iE3WfA6jfyz?=
 =?us-ascii?Q?2nDNjV99rLpm+Nw2xlBpYQZUn8y+fOkNe4I9pmoDNae4YTfJ+ctVv3/FYh0p?=
 =?us-ascii?Q?vpazZyNHHDeoiX+cG4TLXNOhbNnvKqVVBJ3GeRgAV5+v5M/BkVsTsM98bPCA?=
 =?us-ascii?Q?9RZdZIf+WhZ8iLoSk5TYl6qKHz4pceRMWWhL9lbQMCOW6buOxGGcf3xI4ENE?=
 =?us-ascii?Q?8XCKLdMUOe90+BDgJ6g/77mzMwoHR8ruFPSlR2CMMK0vyZ8MDHTJPF6qZwW6?=
 =?us-ascii?Q?p0TJk2cSkDyHBIBU+jL8gKWwAX2yJ833IcoaJXroIcCAg8skyOG0pqhAwolE?=
 =?us-ascii?Q?yHTiPBsEWCpTDwPVl2y7bmtMJpdwecEXDsKDlVbfL8tNgZnIU9FzdEgRB4Ii?=
 =?us-ascii?Q?+0jRQA4DhJ1X5S7ThUoduKgZg60p3PflwohFS1cRILG6/6WOKfaxyG+DWEyK?=
 =?us-ascii?Q?VYxAPNyKTs6vFqtN1KUntFlEVW4wOppq18llXzSyPaSFdZBNFuSEDxGdgx90?=
 =?us-ascii?Q?Pf99y0CQttO/cv9MstsP+hWqV3KvstkZKcr+u7GY0ciepcC44sQQsXGlU1Bb?=
 =?us-ascii?Q?m5X3YH9TPrOhjMQXj1UBI/lJxJh7TKGciQtXwojZX/RBLIZLzzQBfklEU/Wf?=
 =?us-ascii?Q?fm5BcMSGh3G3zsCH/QHaRoJSXyvfT9hzcrtIKWZGRUamwaQcf8csZcJPgFM7?=
 =?us-ascii?Q?bXBTbvlseyVNjzrxkTqBjWAvQLYFhZG8As82ZwPEhtNO8kx6xqtgnPGVvwCA?=
 =?us-ascii?Q?yWaBk7GLxgQ/93CWsECjzHQpKYSCDAqcmmHGHFaVFW7XMEZ2U3t2oqBgrLzQ?=
 =?us-ascii?Q?lo6zbkJiBNclLh8RK3OLGazlnWHcWQvBbZpfhnIk48KUbKKMRAmEJpxKSEIu?=
 =?us-ascii?Q?q9oDLku/gJElJz77WDY+lUEmOEZC/EtMn+BX76QAjq3SDdSDOAZe3R333EQe?=
 =?us-ascii?Q?56L37AMF1HtZ4ilzeof8DMwMNMkoSr1EPBHNkD8m?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6d2c2c22-70e0-4a21-6da8-08ddf543b4c9
X-MS-Exchange-CrossTenant-AuthSource: AS4PR04MB9621.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Sep 2025 17:08:50.2736
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: LkDPDseA3mS5ZLJg3YUnQYwhUIEO8ojtPtsjWhEjaeOab0IxorUxPpSZSfEzQXOSbSY0e92nMM2eVfFTci8Lmw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR04MB7075
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250916_100855_814135_4AFBB5AC 
X-CRM114-Status: GOOD (  18.87  )
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

On Wed, Sep 10, 2025 at 02:01:33PM +0000, Boris Staletic wrote:
> Hello,
>
> We have an I3C bus where the user may ultimately attach an I2C slave with an arbitrary address, with the idea
> of using i2c-utils to communicate with the I2C slave from userland.
>
> With the current kernel, I2C slaves need to be known statically and thus i2cdetect fails to detect any slaves.
> All communication attempts get rejected early, because i3c_master_find_i2c_dev_by_addr returns NULL and then i3c_master_i2c_adapter_xfer exits with ENOENT.
> I3c_master_find_i2c_dev_by_addr returns NULL because bus->devs.i2c ends up being empty.
>
> Since the I2C drivers have i2c_detect and i3c_master_controller has its own i2c_adater, I looked into what needs to be done for networks
> with I3C masters to use the existing i2c_detect mechanism. That lead me to the following list of changes:
>
> - i3c_master_controllr's i2c_adapter needs to have its class member set.
> - In i2c_detect_address, temp_client->dev needs to be populated and registered before the call to i2c_default_probe.
>   - Otherwise the attempt to probe gets rejected early, for the same reason described above (i3c_master_find_i2c_dev_by_addr returning NULL).
>
> That much was enough to get i2c_detect to work with an I3C master.
> To complete the use case I also needed a registered i2c_driver that implements a simple i2c_driver.detect function.
> In my test, the detect function simply checked whether i2c_smbus_read_byte_data(client, 0) returns a non-error value.
>
> Could anyone comment whether this is the right approach for implementing I2C slave detection with an I3C master?

Generally, it is the same as I2C. just send out address, and check if target
ACK/NACK this address.

Address 7E, REPEAT START, scan's address. ACK/NACK STOP.

Check ACK/NACK. But you don't know if it is i3c device or i2c device by this
way.

send 7E to avoid IBI during you send out address.

Fank

> The most iffy part of this approach is the need for such a dummy driver, just so the I3C master knows that "something exists".
> I'd welcome any sort of feedback.
>
> Thanks,
> Boris Staletic
> --
> linux-i3c mailing list
> linux-i3c@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-i3c

-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
